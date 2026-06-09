# KADIKOY — Doldurulmuş Örnek (Sipariş Yönetimi MVP)

Cursor'da `@kadikoy-master` + aşağıdaki bloğu yapıştırın. Kendi projenize uyarlayın.

---

```
@kadikoy-master
@KADIKOY-AGENTS/templates/docs/BUSINESS.md
@KADIKOY-AGENTS/templates/docs/REQUIREMENTS.md
@KADIKOY-AGENTS/templates/docs/CONSTRAINTS.md
@KADIKOY-AGENTS/templates/docs/ACCEPTANCE.md

KADIKOY-AGENTS ekibini NEXUS-Kadıköy modunda aktive et.

## Proje
- Ad: OrderFlow MVP
- Açıklama: B2B müşterilerin sipariş oluşturup takip edebileceği web uygulaması. Admin stok ve sipariş durumunu yönetir.
- İş mantığı özeti: Stok kontrolü zorunlu; ödeme onayı olmadan PAID yok; PENDING 30 dk içinde iptal edilebilir.
- Spec dosyaları: Yukarıdaki @docs şablonlarını proje kökünde docs/ altına kopyalayıp doldur. İlk çalıştırmada Faz 1'de Product Manager bu dosyaları üret/güncelle.

## Teknoloji
- Frontend: Angular 19, standalone components, signals where appropriate
- Backend: Java Spring Boot 3.3
- Veritabanı: PostgreSQL 16
- Mesajlaşma: Kafka evet — order.created, order.paid event'leri
- Mimari tercih: Modular monolith (karar Faz 2'de ADR ile onaylanacak)
- Altyapı: Docker + docker-compose + nginx + GitHub Actions

## Güvenlik
- Auth: JWT HttpOnly Secure SameSite=Lax cookie
- Roller: CUSTOMER, ADMIN
- Hassas veriler: Müşteri email ve adres — KVKK, loglarda maskeleme

## Kabul Kriterleri
- [ ] Angular — sipariş listesi, oluşturma formu, admin panel
- [ ] Java API — OpenAPI, /api/v1, standart hata formatı
- [ ] DB — Flyway migration, sipariş + stok tabloları
- [ ] Kafka — idempotent consumer, order events
- [ ] Docker — docker compose up tek komut
- [ ] CI/CD — PR pipeline yeşil
- [ ] JWT — Senior SecOps kuralları
- [ ] Test — integration + kritik UI
- [ ] Dokümantasyon — README, GUIDELINES, USER-GUIDE, API
- [ ] Rapor — Executive Summary

## Pipeline Talimatı

Agents Orchestrator olarak fazları sırayla yürüt. Her faz sonunda özet sun, insan onayı bekle (@KADIKOY-AGENTS/prompts/FAZ-ONAY.md formatı).

**Faz 0** → @kadikoy-prompt-engineer + @kadikoy-autonomous-optimization-architect
**Faz 1** → @kadikoy-product-manager → docs/BUSINESS.md, REQUIREMENTS.md üret
**Faz 2** → Architect + UX + UI + @kadikoy-database-optimizer
**Faz 3** → DevOps + SecOps + @kadikoy-data-engineer (Kafka)
**Faz 4** → Task task: US-001 auth → US-002 sipariş CRUD → US-003 admin (Dev→Review→Fix→QA)
**Faz 5** → Reality Checker + Technical Writer + Executive Summary

Her faz/task sonunda @docs/HANDOFF.md ve @docs/CHANGELOG.md güncelle.

Davranış:
- Logic tutarsızlığında DUR ve uyar
- Kanıt olmadan tamamlandı deme
- Gereksiz agent/token israfı yok

Şimdi Faz 0 ile başla. Faz 0 bitince dur, onay bekle.
```
