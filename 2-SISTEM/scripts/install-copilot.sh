#!/usr/bin/env bash
#
# KADIKOY-AGENTS — GitHub Copilot / VS Code kurulum scripti

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SISTEM_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
KADIKOY_ROOT="$(cd "$SISTEM_DIR/.." && pwd)"
PROJECT_ROOT="$(cd "$KADIKOY_ROOT/.." && pwd)"

GITHUB_DIR="$PROJECT_ROOT/.github"
INSTRUCTIONS_DIR="$GITHUB_DIR/instructions"
VSCODE_DIR="$PROJECT_ROOT/.vscode"

GREEN=$'\033[0;32m'
BOLD=$'\033[1m'
RESET=$'\033[0m'

ok()   { printf "${GREEN}[OK]${RESET}  %s\n" "$*"; }
info() { printf "      %s\n" "$*"; }

printf "\n${BOLD}KADIKOY-AGENTS → GitHub Copilot / VS Code Kurulumu${RESET}\n\n"

mkdir -p "$INSTRUCTIONS_DIR" "$VSCODE_DIR"

# Ana instruction dosyası (repo'da zaten var; eksikse uyarı)
if [[ -f "$GITHUB_DIR/copilot-instructions.md" ]]; then
  ok "copilot-instructions.md mevcut"
else
  echo "HATA: $GITHUB_DIR/copilot-instructions.md bulunamadı" >&2
  exit 1
fi

count=0
for f in "$INSTRUCTIONS_DIR"/*.instructions.md; do
  [[ -f "$f" ]] || continue
  count=$((count + 1))
  name="$(basename "$f")"
  ok "instruction: $name"
done

if [[ -f "$PROJECT_ROOT/AGENTS.md" ]]; then
  ok "AGENTS.md (workspace root)"
fi
if [[ -f "$PROJECT_ROOT/ExampleFrontend/AGENTS.md" ]]; then
  ok "ExampleFrontend/AGENTS.md"
fi
if [[ -f "$PROJECT_ROOT/ExampleBackend/AGENTS.md" ]]; then
  ok "ExampleBackend/AGENTS.md"
fi

if [[ -f "$VSCODE_DIR/settings.json" ]]; then
  ok ".vscode/settings.json (chat.useAgentsMdFile etkin)"
fi
if [[ -f "$VSCODE_DIR/extensions.json" ]]; then
  ok ".vscode/extensions.json"
fi

echo ""
echo "Kurulum tamam. VS Code'da:"
echo ""
info "1. File → Open Workspace from File → kadikoy.code-workspace"
info "2. Extensions: GitHub Copilot + GitHub Copilot Chat"
info "3. Copilot Chat: \"docs/4-HANDOFF ve docs/2-TASKS oku, KADIKOY Master olarak devam\""
info "4. Prompt şablonları: KADIKOY-AGENTS/COPILOT-PROMPTS.md"
echo ""
echo "Cursor ile paralel:"
info "Cursor:  ./KADIKOY-AGENTS/install-cursor.sh  → @kadikoy-master"
info "Copilot: .github/copilot-instructions.md     → Master protokolü chat'te"
echo ""
ok "$count instruction dosyası + copilot-instructions.md hazır"
echo ""
