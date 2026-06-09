# [PROJE ADI] — Handoff Özeti

> Oturumlar ve fazlar arası devam dosyası. `@docs/HANDOFF.md`
> Her faz/task sonunda agent bu dosyayı günceller; yeni chat'te buradan devam edilir.

**Son güncelleme:** [YYYY-MM-DD HH:MM]
**Durum:** [devam ediyor / bloklu / tamamlandı]

---

## Kanal Özeti (2 sekme)

| Kanal | Cursor rule | Kuyruk dosyası | Sıradaki |
|-------|-------------|----------------|----------|
| **Master** (feature) | `@kadikoy-master` | `@docs/TASKS.md` | [T-xxx] |
| **Ops** (altyapı) | `@kadikoy-ops` | `@docs/OPS-QUEUE.md` | [OPS-xxx] |

---

## Master Kanalı

### Tamamlanan task'lar
| ID | Açıklama | Dosyalar |
|----|----------|----------|
| [T-001] | […] | `frontend/...`, `backend/...` |

### Sıradaki (TASKS.md)
[T-002 açıklama]

---

## Ops Kanalı

### Tamamlanan ops işleri
| ID | Açıklama | Dosyalar |
|----|----------|----------|
| [OPS-001] | [docker-compose] | `docker-compose.yml` |

### Sıradaki (OPS-QUEUE.md)
[OPS-002 açıklama]

---

## 1. Tamamlanan İşler (genel arşiv)

| ID | Açıklama | Dosyalar | Agent |
|----|----------|----------|-------|
| [T-001] | [örn. Sipariş CRUD API] | `src/...`, `test/...` | Backend Architect |
| [T-002] | […] | […] | Frontend Developer |

---

## 2. Aktif / Sıradaki İş

**Şu an:** [Task ID ve açıklama]

**Sıradaki:**
1. [Task]
2. [Task]

**Atlanan fazlar (maliyet):** [örn. Faz 0 atlandı — doküman zaten hazır]

---

## 3. Mimari Kararlar (özet)

| ADR | Karar | Dosya |
|-----|-------|-------|
| ADR-001 | [Monolit] | `docs/adr/ADR-001.md` |

---

## 4. Açık Riskler ve Teknik Borç

| # | Risk | Önem | Sahip |
|---|------|------|-------|
| R-01 | [örn. Kafka DLQ henüz yok] | 🟡 | [—] |

---

## 5. Test Durumu

| Suite | Sonuç | Komut | Tarih |
|-------|-------|-------|-------|
| Integration | [PASS/FAIL] | `./mvnw test` | [tarih] |
| Angular unit | [PASS/FAIL] | `npm test` | [tarih] |

**QA kanıtları:** [screenshot path / log path]

---

## 6. Bloklar (escalation)

> 3 retry sonrası veya insan kararı gereken konular

- [ ] [Blok açıklaması — ne bekleniyor]

---

## 7. Sonraki Oturum İçin Prompt

**Master sekmesi:** `prompts/MASTER-DAILY.md`

**Ops sekmesi:** `prompts/OPS-START.md`

Günlük akış: `prompts/DAILY-WORKFLOW.md`

---

## 8. Değişiklik Geçmişi (bu dosya)

| Tarih | Kim | Ne değişti |
|-------|-----|------------|
| [YYYY-MM-DD] | [Agent/İsim] | [İlk handoff oluşturuldu] |
