# [PROJE ADI] — Fonksiyonel Gereksinimler

> User story ve fonksiyonel gereksinimler. `@docs/REQUIREMENTS.md`

## Özet

| Alan | Değer |
|------|-------|
| Proje | [PROJE ADI] |
| Versiyon | [0.1.0] |
| Hedef kullanıcı | [B2B / B2C / iç kullanıcı] |
| Öncelik | [MVP / Faz 1 / Faz 2] |

---

## Epic'ler

### EPIC-01: [Epic adı]
**Amaç:** [1 cümle]
**İş değeri:** [Neden önemli]

#### US-001: [User story başlığı]
```
Bir [rol] olarak
[hedef/aksiyon]
böylece [değer/fayda]
```

**Kabul kriterleri (Given/When/Then):**
- [ ] **Given** [başlangıç durumu], **When** [aksiyon], **Then** [sonuç]
- [ ] **Given** […], **When** […], **Then** […]

**İş kuralları referansı:** BR-001, BR-002 (`@docs/BUSINESS.md`)

**Öncelik:** [P0 / P1 / P2]
**Tahmini karmaşıklık:** [S / M / L]

---

#### US-002: [User story başlığı]
```
Bir [rol] olarak
[hedef]
böylece [fayda]
```

**Kabul kriterleri:**
- [ ] …

**İş kuralları referansı:** BR-003

**Öncelik:** [P0 / P1 / P2]

---

### EPIC-02: [Epic adı]

#### US-003: …

---

## Fonksiyonel Olmayan Gereksinimler (özet)

| ID | Gereksinim | Hedef |
|----|------------|-------|
| NFR-01 | API yanıt süresi | p95 < 300ms |
| NFR-02 | Erişilebilirlik | WCAG 2.1 AA |
| NFR-03 | Eşzamanlı kullanıcı | [N] |
| NFR-04 | Uptime | %99.5 |

---

## Ekranlar / API Yüzeyi (yüksek seviye)

| ID | Ekran / Endpoint grubu | İlgili US |
|----|------------------------|-----------|
| SCR-01 | [Sipariş listesi] | US-001 |
| API-01 | `POST /api/v1/orders` | US-001 |

---

## Bağımlılıklar ve Sıra

```
US-001 → US-002 (önce auth, sonra sipariş)
US-003 → bağımsız
```

---

## Out of Scope (bu sprint/faz)

- [Yapılmayacak özellik 1]
- [Yapılmayacak özellik 2]
