# Master Sekmesi — Günlük Geliştirme Promptu

**Ayrı Cursor Agent sekmesinde** kullanın (Ops sekmesinden farklı).

---

```
@kadikoy-master
@docs/BUSINESS.md
@docs/TASKS.md
@docs/CONSTRAINTS.md
@docs/HANDOFF.md

Master kanalı — günlük geliştirme.

TASKS.md "Aktif" bölümündeki ilk [ ] maddeyi uygula.
İş kuralları için BUSINESS.md'ye uy; belirsizlikte DUR ve sor.

Döngü:
1. Implement (@kadikoy-frontend-developer veya @kadikoy-backend-architect)
2. @kadikoy-code-reviewer
3. @kadikoy-minimal-change-engineer (🔴 ve 🟡 bulgular)
4. @kadikoy-api-tester [+ @kadikoy-evidence-collector UI ise]

Başarılıysa:
- TASKS'ta [x] işaretle, maddeyi "Tamamlandı" bölümüne taşı
- HANDOFF.md Master bölümünü güncelle

Ops/infra dosyalarına (docker-compose, nginx, .github) DOKUNMA — @kadikoy-ops'un işi.

Bitti. Dur — ben "devam" diyene kadar sonraki maddeye geçme.
```

---

## Yeni madde ekledikten sonra

```
@kadikoy-master
@docs/TASKS.md
@docs/BUSINESS.md

TASKS'a eklediğim son maddeyi yap. Aynı döngü (Dev→Review→Fix→QA).
```

---

## Bloklu madde

```
@kadikoy-master
@docs/TASKS.md

TASKS "Bloklu" bölümündeki [madde]: [kararınız veya açıklama].
Bloku çöz ve maddeyi Aktif'e alıp uygula.
```
