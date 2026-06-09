#!/usr/bin/env bash
#
# Proje kökünde BİR KEZ:
#   ./KADIKOY-AGENTS/setup-one-time*.sh

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
KADIKOY="$(cd "$(dirname "$0")" && pwd)"

echo "=== KADIKOY setup (one time) ==="
echo "Project root: $ROOT"
echo ""

"$KADIKOY/install-cursor.sh"
"$KADIKOY/init-docs.sh"

WS_SRC="$KADIKOY/1-BENIM-DOSYALARIM/9-kadikoy.code-workspace"
WS_DEST="$ROOT/kadikoy.code-workspace"
if [[ -f "$WS_DEST" ]]; then
  echo "[SKIP] Already exists: $WS_DEST"
else
  cp "$WS_SRC" "$WS_DEST"
  echo "[OK]   Workspace: $WS_DEST"
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
echo "Cursor: @kadikoy-ops | @kadikoy-master → devam (bir kez; sorun yoksa otomatik devam)"
echo ""
