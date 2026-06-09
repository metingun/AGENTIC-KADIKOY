# [MODÜL / DOMAIN ADI] — İş Mantığı

> Bu dosya domain kurallarının tek kaynağıdır (single source of truth).
> Agent'lar `@docs/BUSINESS.md` ile referans vererek çalışır.

## 1. Bağlam

- **Proje:** [PROJE ADI]
- **Modül:** [örn. Sipariş Yönetimi]
- **Son güncelleme:** [YYYY-MM-DD]
- **Sahip:** [isim/ekip]

### Amaç
[Bu modül ne iş problemi çözüyor? 2-3 cümle]

### Kapsam dışı
- [Bu modülde OLMAYACAK şeyler — net liste]

---

## 2. Aktörler ve Roller

| Aktör | Açıklama | Yetkiler |
|-------|----------|----------|
| [Müşteri] | [Kim] | [Ne yapabilir] |
| [Admin] | [Kim] | [Ne yapabilir] |
| [Sistem] | [Otomatik işlemler] | [Ne tetikler] |

---

## 3. Domain Kuralları (İş Kuralları)

> Her kural numaralı ve test edilebilir olmalı.

### BR-001: [Kural başlığı]
- **Koşul:** [Ne zaman geçerli]
- **Kural:** [Ne olmalı / ne olmamalı]
- **İstisna:** [Varsa]
- **Hata mesajı:** `[Kullanıcıya gösterilecek mesaj]`

### BR-002: [Kural başlığı]
- **Koşul:**
- **Kural:**
- **İstisna:**
- **Hata mesajı:**

### BR-003: [Kural başlığı]
- **Koşul:**
- **Kural:**
- **İstisna:**
- **Hata mesajı:**

---

## 4. Durum Makinesi (State Machine)

```
[BAŞLANGIÇ] → [DURUM_2] → [DURUM_3] → [BİTİŞ]
                ↓
            [İPTAL_DURUMU]
```

| Mevcut Durum | Olay / Tetikleyici | Sonraki Durum | Kim tetikler |
|--------------|-------------------|---------------|--------------|
| [DRAFT] | [submit] | [PENDING] | [Müşteri] |
| [PENDING] | [payment_confirmed] | [PAID] | [Sistem] |
| [PENDING] | [cancel] | [CANCELLED] | [Müşteri, 30 dk içinde] |

### Geçersiz geçişler
- [PAID] → [DRAFT] **yasak**
- [SHIPPED] → [CANCELLED] **yasak**

---

## 5. Hesaplama ve Validasyon Kuralları

| Alan | Kural | Örnek |
|------|-------|-------|
| [tutar] | [min 0, max X, 2 ondalık] | `99.99` |
| [miktar] | [pozitif tam sayı, max 999] | `3` |
| [tarih] | [geçmiş tarih yasak] | — |

---

## 6. Edge Case'ler

| # | Senaryo | Beklenen davranış |
|---|---------|-------------------|
| EC-01 | [Eşzamanlı iki sipariş aynı stok] | [Optimistic lock, ikinci istek 409] |
| EC-02 | [Ödeme timeout] | [PENDING kalır, 15 dk sonra auto-cancel] |
| EC-03 | [Kafka mesajı tekrar gelir] | [Idempotent consumer, duplicate ignore] |

---

## 7. Event'ler (Kafka / Domain Events)

| Event adı | Ne zaman yayınlanır | Payload özeti | Consumer'lar |
|-----------|---------------------|---------------|--------------|
| `[domain.entity.created]` | [koşul] | `{ id, ... }` | [servis listesi] |
| `[domain.entity.updated]` | [koşul] | `{ id, status, ... }` | [servis listesi] |

---

## 8. Entegrasyonlar

| Sistem | Yön | Amaç | SLA / Timeout |
|--------|-----|------|---------------|
| [Ödeme gateway] | Outbound | [ödeme doğrulama] | [5 sn] |
| [Bildirim servisi] | Outbound | [email/SMS] | [async] |

---

## 9. Açık Sorular

> Agent bu bölümdeki maddeleri görürse DURMALI ve size sormalı.

- [ ] [Belirsiz kural veya karar bekleyen konu]
- [ ] [Onay bekleyen iş kuralı]
