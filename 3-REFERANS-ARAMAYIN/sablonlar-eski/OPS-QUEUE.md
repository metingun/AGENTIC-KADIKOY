# [PROJE ADI] — Ops İş Kuyruğu

> Ops agent (`@kadikoy-ops`) bu dosyayı okur. Geliştirme işleri **burada değil** — `@docs/TASKS.md`

**Son güncelleme:** [YYYY-MM-DD]

---

## Bekleyen (sırayla)

- [ ] OPS-001 docker-compose: MySQL, MongoDB, Kafka, nginx servisleri
- [ ] OPS-002 `.env.example` — tüm connection string'ler
- [ ] OPS-003 GitHub Actions: lint + test pipeline
- [ ] OPS-004 nginx reverse proxy config (frontend + backend)
- [ ] OPS-005 Local dev: tek komut `docker compose up -d`

---

## Periyodik / Manuel tetik (siz "yap" deyince)

> Cursor otomatik zamanlayıcı çalıştırmaz — bu maddeler sizin talimatınızla yapılır.

- [ ] GIT-SYNC commit + push — mesaj: `chore: sync [YYYY-MM-DD HH:MM]`
- [ ] GIT-SYNC sadece commit (push yok)

---

## Deploy (proje sonu / staging)

- [ ] DEPLOY-001 staging ortamı docker compose
- [ ] DEPLOY-002 production checklist (`@docs/ACCEPTANCE.md`)

---

## Tamamlandı

- [x] OPS-000 [örnek] — [tarih]

---

## Ops agent talimatı (kopyala — ayrı Cursor sekmesi)

```
@kadikoy-ops
@docs/OPS-QUEUE.md
@docs/CONSTRAINTS.md

OPS-QUEUE "Bekleyen" bölümündeki ilk [ ] maddeyi yap.
Master chat'teki feature işlerine DOKUNMA — sadece altyapı/ops.
Bitince [x] işaretle, @docs/HANDOFF.md Ops bölümünü güncelle.

Git push SADECE "GIT-SYNC" maddesi veya ben açıkça "push yap" dediğimde.
```
