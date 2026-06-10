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

# Standalone mod: KADIKOY_ROOT kendi .git'ine sahip ama PROJECT_ROOT'ta .git yok
# (AGENTIC-KADIKOY doğrudan proje olarak açılmış)
STANDALONE=false
if [[ -d "$KADIKOY_ROOT/.git" ]] && [[ ! -d "$PROJECT_ROOT/.git" ]]; then
  PROJECT_ROOT="$KADIKOY_ROOT"
  STANDALONE=true
fi

KADIKOY_FOLDER="$(basename "$KADIKOY_ROOT")"
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

# Dağıtılan MDC dosyalarında KADIKOY-AGENTS/ yollarını düzelt
fix_rule_paths() {
  local file="$1"
  if [[ "$STANDALONE" == "true" ]]; then
    # Standalone: KADIKOY-AGENTS/ prefix'ini kaldır (dosyalar PROJECT_ROOT'ta görünür)
    sed -i '' -e "s|KADIKOY-AGENTS/||g" "$file"
  elif [[ "$KADIKOY_FOLDER" != "KADIKOY-AGENTS" ]]; then
    # Submodule: KADIKOY-AGENTS/ → gerçek klasör adı
    sed -i '' -e "s|KADIKOY-AGENTS/|${KADIKOY_FOLDER}/|g" "$file"
  fi
}

printf "\n${BOLD}KADIKOY-AGENTS → Cursor Kurulumu${RESET}\n\n"

if [[ "$STANDALONE" == "true" ]]; then
  echo "[INFO] Standalone mod — proje kökü: $PROJECT_ROOT"
else
  echo "[INFO] Submodule mod — proje kökü: $PROJECT_ROOT"
fi
echo ""

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
  fix_rule_paths "$RULES_DEST/${slug}.mdc"
  printf "  [%s/%s] %s\n" "$count" "$total" "$slug"
done < <(find "$AGENTS_DIR" -maxdepth 1 -name "*.md" -print0 | sort -z)

for mdc_file in kadikoy-master.mdc kadikoy-ops.mdc kadikoy-pancake-theme.mdc; do
  cp "$RULES_SRC/$mdc_file" "$RULES_DEST/$mdc_file"
  fix_rule_paths "$RULES_DEST/$mdc_file"
done
cp "$RULES_SRC/kadikoy-git-response.mdc" "$RULES_DEST/" 2>/dev/null || true
[[ -f "$RULES_DEST/kadikoy-git-response.mdc" ]] && fix_rule_paths "$RULES_DEST/kadikoy-git-response.mdc"

ok "24 Cursor rule + agent-routing.md → $RULES_DEST"
echo ""
echo "v1.7 — Orchestrator strict mode (adım state HANDOFF'ta; atlanamaz)"
echo "Ops:    @kadikoy-ops    → devam"
echo "Master: @kadikoy-master → devam"
echo "Routing: $RULES_DEST/agent-routing.md"
if [[ "$STANDALONE" == "true" ]]; then
  echo "Docs:   docs/ (docs klasörü için: ./init-docs.sh)"
  echo "You edit (*): docs/1-BUSINESS*.md  docs/2-TASKS*.md  docs/3-OPS-QUEUE*.md"
else
  echo "You edit (*): docs/1-BUSINESS*.md docs/2-TASKS*.md docs/3-OPS-QUEUE*.md"
fi
echo ""
