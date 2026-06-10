#!/usr/bin/env bash
set -euo pipefail

# GitHub response repo → response.txt → JSON çıkar → txt yaz
REPO_URL="${RESPONSE_REPO_URL:-https://github.com/metingun/response.git}"
REPO_BRANCH="${RESPONSE_REPO_BRANCH:-main}"
SOURCE_FILE="${RESPONSE_SOURCE_FILE:-response.txt}"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KADIKOY_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
CACHE_DIR="${KADIKOY_ROOT}/.cache/response-repo"
OUTPUT_FILE="${KADIKOY_ROOT}/1-BENIM-DOSYALARIM/response-json.txt"

mkdir -p "$(dirname "${OUTPUT_FILE}")" "${CACHE_DIR}"

if [[ -d "${CACHE_DIR}/.git" ]]; then
  echo ">> git pull (${REPO_BRANCH})"
  git -C "${CACHE_DIR}" fetch origin "${REPO_BRANCH}" --quiet
  git -C "${CACHE_DIR}" checkout "${REPO_BRANCH}" --quiet 2>/dev/null || true
  git -C "${CACHE_DIR}" pull origin "${REPO_BRANCH}" --quiet
else
  echo ">> git clone (${REPO_BRANCH})"
  git clone --depth 1 --branch "${REPO_BRANCH}" "${REPO_URL}" "${CACHE_DIR}" --quiet
fi

SOURCE_PATH="${CACHE_DIR}/${SOURCE_FILE}"
if [[ ! -f "${SOURCE_PATH}" ]]; then
  echo "HATA: ${SOURCE_PATH} bulunamadı" >&2
  exit 1
fi

python3 - "${SOURCE_PATH}" "${OUTPUT_FILE}" << 'PY'
import json
import re
import sys
from pathlib import Path

source = Path(sys.argv[1])
output = Path(sys.argv[2])
text = source.read_text(encoding="utf-8")

# Önce --- HAM SONUC --- bloğunu dene
match = re.search(
    r"---\s*HAM SONUC\s*---\s*(\{[\s\S]*?\})\s*(?:---\s*META\s*---|$)",
    text,
    re.IGNORECASE,
)
if not match:
    match = re.search(r"(\{[\s\S]*\})", text)

if not match:
    raise SystemExit("HATA: response.txt içinde JSON bulunamadı")

raw = match.group(1).strip()
try:
    obj = json.loads(raw)
except json.JSONDecodeError as exc:
    raise SystemExit(f"HATA: JSON parse edilemedi — {exc}") from exc

pretty = json.dumps(obj, indent=2, ensure_ascii=False) + "\n"
output.write_text(pretty, encoding="utf-8")
print(f">> JSON yazıldı: {output}")
print(f">> Issue key: {obj.get('key', '?')}")
PY
