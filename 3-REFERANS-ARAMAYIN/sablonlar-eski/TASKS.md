# [PROJE ADI] — Görev Listesi (Küçük İşler)

> Master agent (`@kadikoy-master`) bu dosyayı okur ve sırayla yapar.
> Büyük iş kuralları: `@docs/BUSINESS.md`

**Son güncelleme:** [YYYY-MM-DD]

---

## Nasıl kullanılır

1. Her satır = tek bir tamamlanabilir iş (frontend veya backend)
2. İş bitince agent `[ ]` → `[x]` yapar
3. İlgili business kuralını parantez içinde referans verin: `(BR-003)`
4. Siz yeni madde ekleyin; agent sadece **Aktif** bölümünden sırayla alır

---

## Aktif (sırayla)

- [ ] T-001 [Backend] [kısa açıklama] (BUSINESS: BR-xxx)
- [ ] T-002 [Frontend] [kısa açıklama] (BUSINESS: BR-xxx)
- [ ] T-003 [Full-stack] [kısa açıklama]

---

## Bloklu (insan kararı bekliyor)

- [ ] T-??? [açıklama] — **Blok:** [neden]

---

## Tamamlandı

- [x] T-000 [örnek] — tamamlanma: [YYYY-MM-DD]

---

## Master agent talimatı (kopyala)

```
@kadikoy-master
@docs/BUSINESS.md
@docs/TASKS.md
@docs/CONSTRAINTS.md

TASKS.md "Aktif" bölümündeki ilk [ ] maddeyi yap.
Dev → @kadikoy-code-reviewer → @kadikoy-minimal-change-engineer → QA.
Bitince [x] işaretle, @docs/HANDOFF.md güncelle.
Sonraki madde için dur — ben "devam" diyene kadar bekleme.
```
