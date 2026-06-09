# KADIKOY — Faz Onay Promptları

Agent faz özeti verdikten sonra kopyala-yapıştır.

---

## Faz onaylandı — devam

```
Faz [N] onaylandı. Özet doğru, riskler kabul edilebilir.
Faz [N+1]'e geç. @docs/HANDOFF.md güncelle.
```

---

## Faz reddedildi — düzeltme

```
Faz [N] RED — düzeltme gerekli:

1. [Sorun / eksik]
2. [Yanlış iş kuralı veya mimari]

@docs/BUSINESS.md [veya ilgili doc] referans al.
Sadece bu maddeleri düzelt, scope genişletme.
Tekrar Faz [N] özeti sun, onay bekle.
```

---

## Mimari karar onayı

```
ADR onaylandı: [Monolit / Mikroservis / ...]
Gerekçe kabul. Faz 3'e geç.
Kararı docs/adr/ADR-001.md olarak kaydet.
```

---

## Task onayı (Faz 4 içi)

```
Task [T-XXX] onaylandı. PASS.
Sıradaki: [T-YYY]. @docs/HANDOFF.md güncelle.
```

---

## Task reddi (retry)

```
Task [T-XXX] FAIL — retry [1/2/3]:

- [Bulgu 1]
- [Bulgu 2]

@kadikoy-minimal-change-engineer ile düzelt, tekrar QA.
3. retry'da escalate — bana sor.
```

---

## Proje / sprint kapatma

```
Sprint kapatılıyor. Faz 5 çalıştır:
@kadikoy-reality-checker
@kadikoy-technical-writer → docs/GUIDELINES.md, docs/USER-GUIDE.md, README
@kadikoy-executive-summary-generator

@docs/ACCEPTANCE.md checklist'ini doldur.
```
