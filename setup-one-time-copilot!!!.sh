#!/usr/bin/env bash
#
# Copilot (VS Code) kurulumu — BİR KEZ çalıştır:
#   ./setup-one-time-copilot!!!.sh        (standalone: AGENTIC-KADIKOY = proje kökü)
#   ./KADIKOY-AGENTS/setup-one-time-copilot!!!.sh  (submodule: üst klasör = proje kökü)
#
# Cursor kullanıyorsan: ./setup-one-time-cursor!!!.sh

set -euo pipefail

KADIKOY="$(cd "$(dirname "$0")" && pwd)"
PARENT="$(cd "$KADIKOY/.." && pwd)"

# Standalone mod: bu klasörün kendi .git'i var, parent'ta .git yok
if [[ -d "$KADIKOY/.git" ]] && [[ ! -d "$PARENT/.git" ]]; then
  ROOT="$KADIKOY"
else
  ROOT="$PARENT"
fi

echo "=== KADIKOY setup — Copilot / VS Code (one time) ==="
echo "Proje kökü : $ROOT"
echo "KADIKOY    : $KADIKOY"
echo ""

"$KADIKOY/install-copilot.sh"
"$KADIKOY/init-docs.sh" "$ROOT"

WS_SRC="$KADIKOY/1-BENIM-DOSYALARIM/9-kadikoy.code-workspace"
WS_DEST="$ROOT/kadikoy.code-workspace"
if [[ -f "$WS_DEST" ]]; then
  echo "[SKIP] Already exists: $WS_DEST"
else
  cp "$WS_SRC" "$WS_DEST"
  echo "[OK]   Workspace: $WS_DEST"
fi

echo ""
echo "=== Done — tekrar çalıştırma (KADIKOY güncellenirse yeniden çalıştır) ==="
echo ""
echo "Düzenle (*):"
echo "  docs/1-BUSINESS-anaBusinessLogicte*.md"
echo "  docs/2-TASKS-araTasklarda*.md"
echo "  docs/3-OPS-QUEUE-opsKuyrugunda*.md"
echo ""
echo "VS Code'da başlat:"
echo "  1. kadikoy.code-workspace aç"
echo "  2. Extensions: GitHub Copilot + GitHub Copilot Chat"
echo "  3. Copilot Chat: COPILOT-PROMPTS.md prompt #1'i yapıştır"
echo ""
