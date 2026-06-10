#!/usr/bin/env bash
#
# Proje kökünde BİR KEZ (VS Code + GitHub Copilot):
#   ./KADIKOY-AGENTS/setup-one-time-copilot*.sh
#
# Cursor kullanıyorsan: ./KADIKOY-AGENTS/setup-one-time*.sh

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
KADIKOY="$(cd "$(dirname "$0")" && pwd)"

echo "=== KADIKOY setup — Copilot / VS Code (one time) ==="
echo "Project root: $ROOT"
echo ""

"$KADIKOY/install-copilot.sh"
"$KADIKOY/init-docs.sh"

WS_SRC="$KADIKOY/1-BENIM-DOSYALARIM/9-kadikoy.code-workspace"
WS_DEST="$ROOT/kadikoy.code-workspace"
if [[ -f "$WS_DEST" ]]; then
  echo "[SKIP] Already exists: $WS_DEST"
else
  cp "$WS_SRC" "$WS_DEST"
  echo "[OK]   Workspace: $WS_DEST"
fi

# .vscode ayarları yoksa workspace'teki önerileri hatırlat
if [[ ! -f "$ROOT/.vscode/settings.json" ]]; then
  echo "[WARN] .vscode/settings.json yok — install-copilot çıktısını kontrol edin"
fi

echo ""
echo "=== Done — do not run again unless KADIKOY package updated ==="
echo ""
echo "You edit (*):"
echo "  docs/1-BUSINESS-anaBusinessLogicte*.md"
echo "  docs/2-TASKS-araTasklarda*.md"
echo "  docs/3-OPS-QUEUE-opsKuyrugunda*.md"
echo "Agent writes: docs/4-HANDOFF ... docs/8-CHANGELOG on proje bitir"
echo ""
echo "VS Code:"
echo "  1. Open kadikoy.code-workspace"
echo "  2. Extensions: GitHub Copilot + GitHub Copilot Chat"
echo "  3. Copilot Chat: \"docs/4-HANDOFF ve docs/2-TASKS oku, KADIKOY Master olarak devam\""
echo "  4. Prompt şablonları: KADIKOY-AGENTS/COPILOT-PROMPTS.md"
echo ""
