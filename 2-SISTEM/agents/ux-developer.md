# ux-developer.md — Birleştirildi (ayrı agent değil)

> **Bu dosya artık bağımsız agent değildir.** "Forma" UI/UX direktifleri kayıpsız olarak ilgili agentlara dağıtıldı.

| İçerik | Hedef agent | Pipeline adımı |
|--------|-------------|----------------|
| Estetik felsefe, vizyon, tipografi, renk, yasak listesi (görsel) | `design-ui-designer.md` → **UI Designer** | FE adım 1 |
| Layout, animasyon spec, responsive mimari, dashboard, tema kalıcılığı, dev brief | `design-ux-architect.md` → **UX Architect** | FE adım 2 |
| Kod implementasyonu, Angular/React/CSS, bileşen CSS, FOUC, kalite kontrol | `engineering-frontend-developer.md` → **Frontend Developer** | FE adım 3 |
| Estetik screenshot QA, generic slop tespiti | `testing-evidence-collector.md` → **Evidence Collector** | FE adım 7 |

**Kurulum:** `install-cursor.sh` bu dosyayı Cursor rule'a **dönüştürmez** (frontmatter yok).

**Orchestrator:** FE pipeline sırası değişmedi — UI Designer → UX Architect → Frontend Developer.
