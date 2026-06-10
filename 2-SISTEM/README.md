# Sistem — dokunmayın

- `agents/` — 20 agent tanımı (+ `ux-developer.md` referans/birleştirme notu — ayrı agent değil)
- Forma estetik DNA: UI Designer → UX Architect → Frontend Developer (+ Evidence Collector QA)
- `agent-routing.md` — pipeline adım listesi (Orchestrator uygular)
- `agents/agents-orchestrator.md` — **gerçek yönetici** (strict state machine)
- `kadikoy-master.mdc`, `kadikoy-ops.mdc` — Cursor rule kaynakları
- `manifest.yaml` — v1.6 pipeline tanımları
- `scripts/install-cursor.sh`, `scripts/install-copilot.sh`, `scripts/init-project-docs.sh`
- `../../.github/copilot-instructions.md` — VS Code + GitHub Copilot (repo kökü)
- `../../.github/instructions/*.instructions.md` — dosya bazlı Copilot kuralları
- `../../AGENTS.md` — çoklu AI aracı için workspace talimatları

**Cursor:** `./KADIKOY-AGENTS/install-cursor.sh` → `@kadikoy-master`

**VS Code + Copilot:** `./KADIKOY-AGENTS/install-copilot.sh` → `kadikoy.code-workspace` aç → Copilot Chat'te Master protokolü

**Copilot prompt şablonları:** `KADIKOY-AGENTS/COPILOT-PROMPTS.md`
