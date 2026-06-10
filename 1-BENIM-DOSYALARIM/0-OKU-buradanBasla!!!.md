# Çalışma sırası

> **`*` son eki** = sizin düzenleyeceğiniz veya çalıştıracağınız dosya. Yıldızsız olanlara dokunmayın (agent yazar).

| # | Dosya | Kim |
|---|-------|-----|
| **0** | `0-OKU-buradanBasla*.md` | **Siz** — okuyun |
| **1** | `1-BUSINESS-anaBusinessLogicte*.md` | **Siz** — iş + teknoloji cümleleri |
| **2** | `2-TASKS-araTasklarda*.md` | **Siz** — FE- / BE- cümleleri |
| **3** | `3-OPS-QUEUE-opsKuyrugunda*.md` | **Siz** — OPS- / altyapı cümleleri |
| **4** | `4-HANDOFF-agentYazar.md` | Agent — her iş sonrası |
| **5** | `5-ACCEPTANCE-projeSonunda.md` | Agent — `proje bitir` |
| **6** | `6-USER-GUIDE-sunumIcin.md` | Agent — sunum / demo |
| **7** | `7-GUIDELINES-projeSonunda.md` | Agent — teknik özet |
| **8** | `8-CHANGELOG-raporlama.md` | Agent — raporlama |
| **9** | `9-kadikoy.code-workspace` | Kurulumda proje köküne kopyalanır |
| **—** | `PANCAKE-DASHBOARD-THEME.md` | **Zorunlu FE tema** — tüm HTML/CSS/UI |

Kaldırılan (gereksiz): `CONSTRAINTS`, `REQUIREMENTS` — teknoloji `1-BUSINESS*` cümlelerinde.

Kurulum (bir kez):
- **Cursor:** `./KADIKOY-AGENTS/setup-one-time*.sh`
- **VS Code + Copilot:** `./KADIKOY-AGENTS/setup-one-time-copilot*.sh`

---

## Orchestrator yönetimi (v1.7)

**`@kadikoy-agents-orchestrator` gerçek yöneticidir.** Master ve Ops yalnızca Orchestrator protokolünü uygular; adım atlanamaz.

- İlerleme: `docs/4-HANDOFF-agentYazar.md` → `## Orchestrator State`
- Agent adı belirtmeniz gerekmez — Orchestrator `agents/` altındaki 20 uzmanı sırayla devreye sokar

| Siz yazarsınız | Master/Ops otomatik çalıştırır |
|----------------|-------------------------------|
| `FE-` cümlesi | UI Designer → UX Architect → Frontend Developer → Review → Fix → QA |
| `BE-` cümlesi | PM (gerekirse) → Software Architect → Backend Architect → DB/Data → Review → QA |
| `OPS-` cümlesi | DevOps → SecOps → DB/Data → API Test → Reality Check |
| Her oturum | Prompt Engineer + Optimization Architect (prompt okuma/yazma) |
| `proje bitir` | Reality Checker → API Tester → Evidence Collector → Technical Writer → Executive Summary |

Detaylı matris: `KADIKOY-AGENTS/2-SISTEM/agent-routing.md`

---

## Sizin günlük işiniz

1. `docs/1-BUSINESS-anaBusinessLogicte*.md` doldur
2. `docs/2-TASKS-araTasklarda*.md` FE/BE cümleleri
3. `docs/3-OPS-QUEUE-opsKuyrugunda*.md` OPS cümleleri
4. Cursor: `@kadikoy-ops` veya `@kadikoy-master` → `devam` (bir kez başlatır)
5. Agent sorun yoksa sıradaki işe **otomatik devam eder** — her iş için `devam` yazmanız gerekmez
6. `docs/4-HANDOFF-agentYazar.md` oku (hangi agentlar çalıştı — isteğe bağlı)
7. Bitince Master: `proje bitir` → 5–8 agent doldurur

---

## Cursor

| Sekme | Komut |
|-------|-------|
| Ops | `@kadikoy-ops` → `devam` (başlat; sonra otomatik) |
| Master | `@kadikoy-master` → `devam` (başlat; sonra otomatik) |
| FE tema | `@kadikoy-pancake-theme` — tüm HTML/CSS/UI **Pancake Dashboard** |
| Sorun / blok | Agent durur — onay veya cevap verin |
| Push | Ops → `push yap` |
| Sunum hazırlık | Master → `proje bitir` |
