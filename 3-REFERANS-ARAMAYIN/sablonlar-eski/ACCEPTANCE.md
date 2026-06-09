# [PROJE ADI / SPRINT ADI] — Kabul Kriterleri

> Teslim öncesi checklist. `@docs/ACCEPTANCE.md`
> Reality Checker ve siz bu listeyi kullanarak PASS/FAIL verirsiniz.

## Sprint / Faz Bilgisi

| Alan | Değer |
|------|-------|
| Sprint | [Sprint-01 / Faz-4-Task-3] |
| Kapsam | [US-001, US-002] |
| Hedef tarih | [YYYY-MM-DD] |

---

## İş Mantığı

- [ ] Tüm BR-* kuralları (`@docs/BUSINESS.md`) implement edildi
- [ ] State geçişleri doğru; yasak geçişler engelleniyor
- [ ] Edge case'ler (EC-*) test edildi
- [ ] Açık sorular (`BUSINESS.md §9`) kapatıldı veya bilinçli ertelendi

---

## Backend (Java / Spring Boot)

- [ ] API OpenAPI spec güncel (`docs/api/openapi.yaml` veya eşdeğeri)
- [ ] Endpoint'ler versioned (`/api/v1/...`)
- [ ] Standart hata formatı (code, message, correlationId)
- [ ] DB migration uygulandı, rollback planı dokümante
- [ ] Integration test suite geçiyor
- [ ] Auth/JWT değişikliği varsa Senior SecOps onaylı

---

## Frontend (Angular)

- [ ] Responsive (mobile-first)
- [ ] WCAG 2.1 AA temel kontroller
- [ ] Tasarım sistemi token'larına uyum
- [ ] Core Web Vitals hedefleri (`@docs/CONSTRAINTS.md`)
- [ ] Component testleri (kritik akışlar)

---

## Altyapı

- [ ] `docker compose up` ile local ayağa kalkıyor
- [ ] nginx config doğru proxy yapıyor
- [ ] GitHub Actions pipeline yeşil
- [ ] `.env.example` güncel, secret'lar kodda yok

---

## Kafka (varsa)

- [ ] Topic'ler tanımlı
- [ ] Producer/consumer idempotent
- [ ] Dead-letter queue yapılandırıldı
- [ ] Event şeması dokümante

---

## Kalite Döngüsü

- [ ] Code Reviewer review tamamlandı (🔴 blocker = 0)
- [ ] Minimal Change Engineer düzeltmeleri uygulandı
- [ ] API Tester PASS
- [ ] Evidence Collector UI kanıtı (screenshot/path)
- [ ] Max 3 retry kuralına uyuldu

---

## Dokümantasyon

- [ ] README güncel
- [ ] `docs/GUIDELINES.md` (varsa) uyumlu
- [ ] API docs güncel
- [ ] `docs/HANDOFF.md` güncel

---

## Sertifikasyon

- [ ] Reality Checker: **PASS** / NEEDS WORK
- [ ] Executive Summary üretildi (faz sonu)

---

## İmza / Onay

| Rol | Durum | Tarih |
|-----|-------|-------|
| İnsan onay (siz) | [ ] Onaylandı | |
| Reality Checker | [ ] PASS | |
