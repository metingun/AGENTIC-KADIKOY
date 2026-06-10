#!/usr/bin/env bash
#
# 1-BENIM-DOSYALARIM → docs/ (0-OKU ve 9-workspace hariç)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KADIKOY_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
SOURCE="$KADIKOY_ROOT/1-BENIM-DOSYALARIM"
TARGET="${1:-$(pwd)}"
DOCS_DIR="$TARGET/docs"

mkdir -p "$DOCS_DIR"

shopt -s nullglob
for src in "$SOURCE"/[1-8]-*.md; do
  base="$(basename "$src")"
  dest="$DOCS_DIR/$base"
  if [[ -f "$dest" ]]; then
    echo "[SKIP] Already exists: $dest"
  else
    cp "$src" "$dest"
    echo "[OK]   Created: $dest"
  fi
done

echo ""
echo "You fill (*): docs/1-BUSINESS-anaBusinessLogicte*.md"
echo "              docs/2-TASKS-araTasklarda*.md"
echo "              docs/3-OPS-QUEUE-opsKuyrugunda*.md"
echo "Agent fills:    docs/4-HANDOFF ... docs/8-CHANGELOG"
