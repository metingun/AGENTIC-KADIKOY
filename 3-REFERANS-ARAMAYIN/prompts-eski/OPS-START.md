# Ops Sekmesi — Başlangıç Promptu

**Ayrı Cursor Agent sekmesinde** kullanın.

---

```
@kadikoy-ops
@docs/OPS-QUEUE.md
@docs/CONSTRAINTS.md
@docs/HANDOFF.md

Ops kanalı aktif.

OPS-QUEUE.md "Bekleyen" bölümündeki ilk tamamlanmamış [ ] maddeyi yap.
Sadece altyapı/ops — @docs/TASKS.md ve feature koduna dokunma.

Bitince:
- OPS-QUEUE'da [x] işaretle
- HANDOFF.md Ops bölümünü güncelle
- Nasıl test edileceğini yaz (örn. docker compose config, curl health)

Git commit: sadece bu ops işi için anlamlı commit.
Git push: SADECE GIT-SYNC maddesi veya ben "push yap" dediysem.

Bitti. Dur — sonraki ops işi için ben "devam" diyene kadar bekle.
```

---

## Tekrar (yeni ops işi)

```
@kadikoy-ops
@docs/OPS-QUEUE.md

Sıradaki bekleyen ops işine devam et.
```

---

## Git push (manuel)

```
@kadikoy-ops

Tüm staged değişiklikleri commit et ve GitHub'a push yap.
Mesaj: chore: sync [bugünün tarihi]
Secret dosyası commit edilmediğini doğrula.
```
