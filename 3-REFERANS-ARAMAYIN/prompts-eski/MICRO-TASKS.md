# KADIKOY — Hızlı Tek Görev Promptları

Tek bir agent ile kısa işler için kopyala-yapıştır şablonları.

---

## Yeni Feature (Backend)

```
@kadikoy-backend-architect

Proje: [PROJE ADI]
Feature: [FEATURE AÇIKLAMASI]
Stack: Java Spring Boot + PostgreSQL

Implement et. Sonra @kadikoy-api-tester ile integration test yaz.
@kadikoy-code-reviewer ile PR review yap.
```

## Yeni Feature (Angular UI)

```
@kadikoy-frontend-developer

Proje: [PROJE ADI]
Feature: [FEATURE AÇIKLAMASI]
Tasarım: [design-system path veya Figma link]
API: [OpenAPI spec path]

Angular standalone component olarak implement et.
@kadikoy-evidence-collector ile UI doğrula.
```

## JWT / Auth Review

```
@kadikoy-senior-secops-engineer

Projede JWT implementasyonunu incele:
- [auth config dosya yolları]

Kontrol et: hardcoded secret, localStorage token, algorithm confusion,
HttpOnly cookie, refresh token rotation.
Bulduğun her sorunu severity ile listele ve düzeltme patch'i öner.
```

## Docker + CI/CD Kurulumu

```
@kadikoy-devops-automator

Proje: [PROJE ADI]
Stack: Angular frontend + Java Spring Boot + PostgreSQL [+ Kafka]

Oluştur:
1. docker-compose.yml (local dev tek komut)
2. nginx reverse proxy config
3. GitHub Actions: lint → test → build → security scan
4. Multi-stage Dockerfile (frontend + backend)

.env.example ile secret yönetimi dokümante et.
```

## Kafka Event Pipeline

```
@kadikoy-data-engineer

Domain: [DOMAIN — örn. sipariş, bildirim]
Events: [event listesi]

Tasarla:
- Topic'ler, partition stratejisi
- Producer/consumer (Spring Kafka)
- Idempotency + dead-letter queue
- docker-compose Kafka servisi

@kadikoy-backend-architect ile API entegrasyonunu koordine et.
```

## DB Şema & Migration

```
@kadikoy-database-optimizer

Mevcut şema: [path veya açıklama]
Yeni gereksinim: [ne ekleniyor/değişiyor]

Üret: ER diyagramı, Flyway/Liquibase migration, index planı,
rollback stratejisi, slow query risk analizi.
```

## Mimari Karar (Monolit vs Mikroservis)

```
@kadikoy-software-architect

Proje: [PROJE ADI]
Bağlam: [takım büyüklüğü, trafik, domain karmaşıklığı]

Monolit / modular monolith / mikroservis kararı ver.
ADR formatında yaz: context, decision, consequences, alternatives.
@kadikoy-backend-architect ile API sınırlarını netleştir.
```

## Proje Sonu Raporu

```
@kadikoy-executive-summary-generator

Proje: [PROJE ADI]
Tamamlanan fazlar: [liste]
Test sonuçları: [özet]
Açık riskler: [liste]

Yönetici özeti üret: executive summary, teknik özet, risk matrisi,
sonraki adımlar, KPI'lar.
```

## Production-Ready Kontrol

```
@kadikoy-reality-checker

Proje: [PROJE ADI]
Release adayı: [branch/tag]

Integration test yap. Gerçekçi deployment senaryolarını kontrol et.
Varsayılan: NEEDS WORK — kanıtla PASS ver.
```

## Prompt Düzenleme (Agent'lara İletim)

```
@kadikoy-prompt-engineer

Ham istek:
[YAZDIĞINIZ PROMPT — belirsiz, uzun veya dağınık olabilir]

Hedef agent: [@kadikoy-backend-architect / @kadikoy-frontend-developer / ...]
Beklenen çıktı: [kod / PRD / mimari karar / test suite]

Bu isteği yapılandırılmış agent promptuna çevir:
- Rol, kısıtlar, kabul kriterleri, çıktı formatı
- Edge case ve fail mode senaryoları
- Handoff için gerekli context alanları
```

## LLM Maliyet Optimizasyonu

```
@kadikoy-autonomous-optimization-architect

Kullanım senaryosu: [agent pipeline / API routing / model seçimi]
Mevcut maliyet: [tahmini token kullanımı veya model listesi]
Bütçe limiti: [örn. $X/ay veya max token/task]

Öner:
- Hangi agent/model hangi görev için (ucuz vs güçlü)
- Token bütçesi ve context kısaltma stratejisi
- Circuit breaker ve fallback planı
- Gereksiz agent çağrılarını elimine et
```

## Code Review + Düzeltme Döngüsü

```
@kadikoy-code-reviewer

Değişen dosyalar: [path listesi veya PR link]
Task: [ne implement edildi]

Review yap: 🔴 blocker / 🟡 suggestion / 💭 nit formatında listele.
Her bulgu için dosya:satır ve düzeltme önerisi ver.

Review bitince @kadikoy-minimal-change-engineer'i çağır:
sadece 🔴 ve 🟡 bulguları minimum diff ile düzelt, scope creep yok.
```

## Kullanım Kılavuzu & Guideline

```
@kadikoy-technical-writer

Proje: [PROJE ADI]
Tamamlanan özellikler: [liste]
Hedef kitle: [geliştirici / son kullanıcı / operasyon ekibi]

Üret:
1. README — kurulum, hızlı başlangıç, mimari özet
2. docs/GUIDELINES.md — kod standartları, branch stratejisi, PR kuralları
3. docs/USER-GUIDE.md — son kullanıcı kullanım kılavuzu
4. docs/API.md veya OpenAPI referansı
5. docs/DEPLOYMENT.md — Docker, nginx, CI/CD adımları

Tüm kod örnekleri çalışır durumda olsun.
```
