# Proje Bitişi — Doküman, Sunum, Deploy

TASKS.md tamamlandığında **Master sekmesinde** çalıştırın. Ardından **Ops sekmesinde** deploy.

---

## 1. Master — Doküman ve sertifikasyon

```
@kadikoy-master
@docs/BUSINESS.md
@docs/TASKS.md
@docs/ACCEPTANCE.md
@docs/HANDOFF.md

Proje bitiş fazı.

1. @kadikoy-reality-checker — @docs/ACCEPTANCE.md checklist, PASS/NEEDS WORK
2. @kadikoy-technical-writer:
   - docs/GUIDELINES.md
   - docs/USER-GUIDE.md
   - README güncelle
   - API dokümantasyonu
3. @kadikoy-executive-summary-generator — yönetici özeti + sunuma hazır executive brief (markdown)

Tüm TASKS [x] mi kontrol et. HANDOFF ve CHANGELOG güncelle.
```

---

## 2. Ops — Çalışır deploy

```
@kadikoy-ops
@docs/OPS-QUEUE.md
@docs/CONSTRAINTS.md

Proje deploy fazı.

OPS-QUEUE Deploy bölümündeki maddeleri sırayla yap.
Uygulama local'de çalışır halde olmalı: docker compose up + health check kanıtı.

Sonra GIT-SYNC: anlamlı commit + push (ben onaylıyorum).

Özet: erişim URL'leri, varsayılan portlar, .env adımları.
```

---

## Sunum için

Executive Summary çıktısını + `docs/USER-GUIDE.md` özetini kullanın.
İsterseniz Technical Writer'dan ayrıca `docs/PRESENTATION.md` (slide outline) isteyin.
