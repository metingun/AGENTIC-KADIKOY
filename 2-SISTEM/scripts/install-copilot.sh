#!/usr/bin/env bash
#
# KADIKOY-AGENTS — GitHub Copilot / VS Code kurulum scripti
# Bu script dosyaları OLUŞTURUR (sadece doğrulamaz).

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SISTEM_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
KADIKOY_ROOT="$(cd "$SISTEM_DIR/.." && pwd)"
PROJECT_ROOT="$(cd "$KADIKOY_ROOT/.." && pwd)"

# Standalone mod: KADIKOY_ROOT kendi .git'ine sahip ama PROJECT_ROOT'ta .git yok
STANDALONE=false
if [[ -d "$KADIKOY_ROOT/.git" ]] && [[ ! -d "$PROJECT_ROOT/.git" ]]; then
  PROJECT_ROOT="$KADIKOY_ROOT"
  STANDALONE=true
fi

KADIKOY_FOLDER="$(basename "$KADIKOY_ROOT")"
GITHUB_DIR="$PROJECT_ROOT/.github"
INSTRUCTIONS_DIR="$GITHUB_DIR/instructions"
VSCODE_DIR="$PROJECT_ROOT/.vscode"

GREEN=$'\033[0;32m'
BOLD=$'\033[1m'
RESET=$'\033[0m'

ok()   { printf "${GREEN}[OK]${RESET}  %s\n" "$*"; }
info() { printf "      %s\n" "$*"; }

# MDC body çıkar (frontmatter'ı atla)
get_body() {
  awk 'BEGIN{fm=0} /^---$/{fm++; next} fm>=2{print}' "$1"
}

# Üretilen dosyalarda KADIKOY-AGENTS/ yollarını düzelt
fix_paths() {
  local file="$1"
  if [[ "$STANDALONE" == "true" ]]; then
    sed -i '' -e "s|KADIKOY-AGENTS/||g" "$file"
  elif [[ "$KADIKOY_FOLDER" != "KADIKOY-AGENTS" ]]; then
    sed -i '' -e "s|KADIKOY-AGENTS/|${KADIKOY_FOLDER}/|g" "$file"
  fi
}

printf "\n${BOLD}KADIKOY-AGENTS → GitHub Copilot / VS Code Kurulumu${RESET}\n\n"

if [[ "$STANDALONE" == "true" ]]; then
  echo "[INFO] Standalone mod — proje kökü: $PROJECT_ROOT"
  DOCS_PATH="docs"
  AGENTS_PREFIX=""
else
  echo "[INFO] Submodule mod — proje kökü: $PROJECT_ROOT"
  DOCS_PATH="docs"
  AGENTS_PREFIX="${KADIKOY_FOLDER}/"
fi
echo ""

mkdir -p "$INSTRUCTIONS_DIR" "$VSCODE_DIR"

MASTER_BODY="$(get_body "$SISTEM_DIR/kadikoy-master.mdc")"
OPS_BODY="$(get_body "$SISTEM_DIR/kadikoy-ops.mdc")"

# ─── 1. copilot-instructions.md ───────────────────────────────────────────────
COPILOT_INST="$GITHUB_DIR/copilot-instructions.md"

cat > "$COPILOT_INST" << 'BODY_START'
# KADIKOY — GitHub Copilot Talimatları

Bu proje **KADIKOY-AGENTS v1.7** orchestration sistemini kullanmaktadır.
Her yanıtta `## [Orchestrator] Adım N/M` bloğu üret.
Tek seferde yalnızca **bir** pipeline adımı ilerlet.
Adım bitince `docs/4-HANDOFF-agentYazar.md` Orchestrator State güncelle.

## Hızlı Başlangıç

- **Master kanalı (FE/BE):** `COPILOT-PROMPTS.md` prompt #1
- **Ops kanalı (Docker/CI):** `COPILOT-PROMPTS.md` prompt #5
- **Pipeline adım listesi:** `2-SISTEM/agent-routing.md`
- **Prompt şablonları:** `COPILOT-PROMPTS.md` (12 şablon)

---

BODY_START

# Master ve Ops içeriklerini ekle
printf '%s\n\n---\n\n%s\n' "$MASTER_BODY" "$OPS_BODY" >> "$COPILOT_INST"

cat >> "$COPILOT_INST" << 'BODY_END'

---

## Dosya Haritası

| Dosya | Rol |
|-------|-----|
| `docs/1-BUSINESS-anaBusinessLogicte*.md` | İş + teknoloji — kullanıcı yazar |
| `docs/2-TASKS-araTasklarda*.md` | FE-/BE- görev kuyruğu — kullanıcı yazar |
| `docs/3-OPS-QUEUE-opsKuyrugunda*.md` | OPS- kuyruğu — kullanıcı yazar |
| `docs/4-HANDOFF-agentYazar.md` | Orchestrator State — her görev başı oku |
| `2-SISTEM/agent-routing.md` | Pipeline adım listesi |
| `1-BENIM-DOSYALARIM/PANCAKE-DASHBOARD-THEME.md` | FE tema (zorunlu) |

BODY_END

fix_paths "$COPILOT_INST"
ok "copilot-instructions.md → $COPILOT_INST"

# ─── 2. .github/instructions/kadikoy-master.instructions.md ───────────────────
MASTER_INST="$INSTRUCTIONS_DIR/kadikoy-master.instructions.md"

cat > "$MASTER_INST" << 'FRONT'
---
applyTo: "frontend/**,backend/**,docs/**,src/**"
---

FRONT

printf '%s\n' "$MASTER_BODY" >> "$MASTER_INST"
fix_paths "$MASTER_INST"
ok "instructions/kadikoy-master.instructions.md"

# ─── 3. .github/instructions/kadikoy-ops.instructions.md ─────────────────────
OPS_INST="$INSTRUCTIONS_DIR/kadikoy-ops.instructions.md"

cat > "$OPS_INST" << 'FRONT'
---
applyTo: "docker-compose*.yml,**/Dockerfile*,**/nginx/**,.github/workflows/**,.env.example,docs/**"
---

FRONT

printf '%s\n' "$OPS_BODY" >> "$OPS_INST"
fix_paths "$OPS_INST"
ok "instructions/kadikoy-ops.instructions.md"

# ─── 4. AGENTS.md ─────────────────────────────────────────────────────────────
AGENTS_MD="$PROJECT_ROOT/AGENTS.md"

cat > "$AGENTS_MD" << 'BODY_START'
# KADIKOY-AGENTS — Copilot Agent Kılavuzu

Bu proje KADIKOY-AGENTS v1.7 orchestration sistemini kullanır.

## Başlatma

Prompt şablonları için `COPILOT-PROMPTS.md` dosyasına bak.

**Master (FE/BE):** Copilot Chat'e prompt #1'i yapıştır.
**Ops (Docker/CI):** Copilot Chat'e prompt #5'i yapıştır.

## Zorunlu Kurallar

- Her yanıtta `## [Orchestrator] Adım N/M` bloğu üret
- Tek seferde yalnızca bir adım ilerlet
- Her adım sonunda `docs/4-HANDOFF-agentYazar.md` güncelle
- QA PASS olmadan task ✓ işaretleme

## Dosyalar

| Dosya | Rol |
|-------|-----|
| `docs/1-BUSINESS-anaBusinessLogicte*.md` | İş + teknoloji |
| `docs/2-TASKS-araTasklarda*.md` | FE-/BE- kuyruğu |
| `docs/3-OPS-QUEUE-opsKuyrugunda*.md` | OPS- kuyruğu |
| `docs/4-HANDOFF-agentYazar.md` | Orchestrator State |
| `2-SISTEM/agent-routing.md` | Pipeline adım listesi |

BODY_START

fix_paths "$AGENTS_MD"
ok "AGENTS.md → $AGENTS_MD"

# ─── 5. .vscode/settings.json ─────────────────────────────────────────────────
VSCODE_SETTINGS="$VSCODE_DIR/settings.json"
if [[ ! -f "$VSCODE_SETTINGS" ]]; then
  cat > "$VSCODE_SETTINGS" << 'JSON'
{
  "github.copilot.enable": {
    "*": true
  },
  "github.copilot.chat.useInstructionFiles": true,
  "github.copilot.chat.codeGeneration.useInstructionFiles": true,
  "chat.useAgentsMdFile": true,
  "chat.useNestedAgentsMdFiles": true,
  "chat.includeApplyingInstructions": true,
  "chat.includeReferencedInstructions": true
}
JSON
  ok ".vscode/settings.json oluşturuldu"
else
  # Mevcut settings.json'a eksik Copilot ayarlarını ekle (merge değil, bilgi ver)
  ok ".vscode/settings.json mevcut — manuel olarak şu ayarların olduğunu kontrol edin:"
  info "  \"github.copilot.chat.useInstructionFiles\": true"
  info "  \"chat.useAgentsMdFile\": true"
  info "  \"chat.includeApplyingInstructions\": true"
fi

# ─── 6. .vscode/extensions.json ───────────────────────────────────────────────
VSCODE_EXT="$VSCODE_DIR/extensions.json"
if [[ ! -f "$VSCODE_EXT" ]]; then
  cat > "$VSCODE_EXT" << 'JSON'
{
  "recommendations": [
    "github.copilot",
    "github.copilot-chat"
  ]
}
JSON
  ok ".vscode/extensions.json oluşturuldu"
else
  ok ".vscode/extensions.json mevcut (dokunulmadı)"
fi

# ─── 7. COPILOT-PROMPTS.md (submodule modda proje köküne düzeltilmiş kopya) ───
PROMPTS_SRC="$KADIKOY_ROOT/COPILOT-PROMPTS.md"

if [[ -f "$PROMPTS_SRC" ]] && [[ "$PROJECT_ROOT" != "$KADIKOY_ROOT" ]]; then
  PROMPTS_DEST="$PROJECT_ROOT/COPILOT-PROMPTS.md"
  cp "$PROMPTS_SRC" "$PROMPTS_DEST"
  fix_paths "$PROMPTS_DEST"
  ok "COPILOT-PROMPTS.md (yollar düzeltildi) → $PROMPTS_DEST"
fi

echo ""
echo "Kurulum tamam. VS Code'da:"
echo ""
info "1. File → Open Workspace from File → kadikoy.code-workspace"
info "2. Extensions: GitHub Copilot + GitHub Copilot Chat"
info "3. Copilot Chat: COPILOT-PROMPTS.md prompt #1'i yapıştır"
echo ""
echo "Copilot instruction dosyaları:"
info ".github/copilot-instructions.md               → her sohbete otomatik eklenir"
info ".github/instructions/kadikoy-master.md        → FE/BE dosyalarında otomatik aktif"
info ".github/instructions/kadikoy-ops.instructions.md → Docker/CI dosyalarında otomatik aktif"
echo ""

if [[ "$STANDALONE" == "true" ]]; then
  echo "NOT (standalone mod):"
  info "COPILOT-PROMPTS.md içindeki 'KADIKOY-AGENTS/' prefix'ini"
  info "Copilot Chat'e yapıştırırken silmeniz gerekebilir."
  info "copilot-instructions.md içindeki yollar zaten düzeltildi."
  echo ""
fi

echo "Cursor ile paralel:"
info "Cursor:  ./install-cursor.sh  → @kadikoy-master / @kadikoy-ops"
info "Copilot: .github/copilot-instructions.md → aynı Master/Ops protokolü"
echo ""
ok "copilot-instructions.md + 2 instruction + AGENTS.md + .vscode hazır"
echo ""
