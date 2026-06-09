# KADIKOY — Günlük 2 Kanal Çalışma (Basit)

Karmaşık 5 faz pipeline yerine **günlük bu akışı** kullanın.

---

## Kurulum (bir kez)

```bash
./KADIKOY-AGENTS/install-cursor.sh
./KADIKOY-AGENTS/scripts/init-project-docs.sh
```

1. `docs/BUSINESS.md` — büyük iş süreçlerini doldurun
2. `docs/TASKS.md` — küçük maddeleri ekleyin
3. `docs/OPS-QUEUE.md` — docker, DB, nginx, CI işlerini ekleyin
4. `docs/CONSTRAINTS.md` — MySQL, MongoDB, Kafka stack'inizi doğrulayın

Cursor'da workspace: `templates/kadikoy.code-workspace.example.json` dosyasını kopyalayıp path'leri düzenleyin.

---

## İki ayrı Agent sekmesi

| Sekme | Rule | Okuduğu dosya | Ne yapar |
|-------|------|---------------|----------|
| **1 — Ops** | `@kadikoy-ops` | `OPS-QUEUE.md` | Docker, MySQL, MongoDB, Kafka, nginx, git, deploy |
| **2 — Master** | `@kadikoy-master` | `BUSINESS.md` + `TASKS.md` | Frontend + backend feature |

**Paralel çalışma:** İki sekmeyi aynı anda açık tutun; Ops infra hazırlarken Master feature yazar.

---

## Sekme 1 — Ops (prompts/OPS-START.md)

## Sekme 2 — Master (prompts/MASTER-DAILY.md)

---

## Siz ne yaparsınız?

| Ne zaman | Siz |
|----------|-----|
| Yeni feature | `TASKS.md`'ye madde ekle → Master sekmesine "devam" |
| Infra ihtiyacı | `OPS-QUEUE.md`'ye madde ekle → Ops sekmesine "devam" |
| Git push | OPS-QUEUE'ya GIT-SYNC ekle veya Ops'e "push yap" de |
| İş bitti | `prompts/PROJECT-FINISH.md` |

---

## Proje başı (opsiyonel, bir kez)

Tam mimari gerekiyorsa: `MASTER-START.md` (5 faz). Günlük işte **gerekmez**.

## Proje sonu

`PROJECT-FINISH.md` — doküman, sunum, deploy, çalışır uygulama.
