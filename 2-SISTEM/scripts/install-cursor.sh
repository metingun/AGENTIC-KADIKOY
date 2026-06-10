#!/usr/bin/env bash
#
# KADIKOY-AGENTS — Cursor kurulum scripti

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SISTEM_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
KADIKOY_ROOT="$(cd "$SISTEM_DIR/.." && pwd)"
PROJECT_ROOT="$(cd "$KADIKOY_ROOT/.." && pwd)"
AGENTS_DIR="$SISTEM_DIR/agents"
RULES_SRC="$SISTEM_DIR/cursor-rules"
RULES_DEST="$PROJECT_ROOT/.cursor/rules/kadikoy"

GREEN=$'\033[0;32m'
BOLD=$'\033[1m'
RESET=$'\033[0m'

ok()   { printf "${GREEN}[OK]${RESET}  %s\n" "$*"; }

get_field() {
  awk -v f="$1" '
    /^---$/ { fm++; next }
    fm == 1 && $0 ~ "^" f ": " { sub("^" f ": ", ""); print; exit }
  ' "$2"
}

get_body() {
  awk 'BEGIN{fm=0} /^---$/{fm++; next} fm>=2{print}' "$1"
}

slugify() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//;s/-$//'
}

convert_agent() {
  local file="$1" name description slug body outfile
  name="$(get_field "name" "$file")"
  description="$(get_field "description" "$file")"
  slug="kadikoy-$(slugify "$name")"
  body="$(get_body "$file")"
  outfile="$RULES_SRC/${slug}.mdc"
  cat > "$outfile" <<HEREDOC
---
description: [KADIKOY] ${description}
globs: ""
alwaysApply: false
---
${body}
HEREDOC
  echo "$slug"
}

printf "\n${BOLD}KADIKOY-AGENTS → Cursor Kurulumu${RESET}\n\n"

mkdir -p "$RULES_SRC" "$RULES_DEST"

cp "$SISTEM_DIR/kadikoy-master.mdc" "$RULES_SRC/kadikoy-master.mdc"
cp "$SISTEM_DIR/kadikoy-ops.mdc" "$RULES_SRC/kadikoy-ops.mdc"
cp "$SISTEM_DIR/kadikoy-pancake-theme.mdc" "$RULES_SRC/kadikoy-pancake-theme.mdc"
cp "$SISTEM_DIR/kadikoy-git-response.mdc" "$RULES_SRC/kadikoy-git-response.mdc" 2>/dev/null || true
cp "$SISTEM_DIR/agent-routing.md" "$RULES_DEST/agent-routing.md"

count=0
total=$(find "$AGENTS_DIR" -maxdepth 1 -name "*.md" | wc -l | tr -d ' ')

while IFS= read -r -d '' file; do
  # ux-developer.md birleştirildi — ayrı agent değil, frontmatter yok
  case "$(basename "$file")" in
    ux-developer.md) continue ;;
  esac
  count=$((count + 1))
  slug="$(convert_agent "$file")"
  cp "$RULES_SRC/${slug}.mdc" "$RULES_DEST/"
  printf "  [%s/%s] %s\n" "$count" "$total" "$slug"
done < <(find "$AGENTS_DIR" -maxdepth 1 -name "*.md" -print0 | sort -z)

cp "$RULES_SRC/kadikoy-master.mdc" "$RULES_DEST/"
cp "$RULES_SRC/kadikoy-ops.mdc" "$RULES_DEST/"
cp "$RULES_SRC/kadikoy-pancake-theme.mdc" "$RULES_DEST/"
cp "$RULES_SRC/kadikoy-git-response.mdc" "$RULES_DEST/" 2>/dev/null || true

ok "24 Cursor rule + agent-routing.md → $RULES_DEST"
echo ""
echo "v1.7 — Orchestrator strict mode (adım state HANDOFF'ta; atlanamaz)"
echo "Ops:    @kadikoy-ops   → devam (bir kez; sorun yoksa otomatik devam)"
echo "Master: @kadikoy-master → devam (bir kez; sorun yoksa otomatik devam)"
echo "Routing: .cursor/rules/kadikoy/agent-routing.md"
echo "You edit (*): docs/1-BUSINESS*.md docs/2-TASKS*.md docs/3-OPS-QUEUE*.md"
echo ""
