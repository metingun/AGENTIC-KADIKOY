# [PROJE ADI] — Geliştirme Guideline'ları

> Faz 5'te Technical Writer tarafından doldurulur. Şablon başlangıç iskeleti.

## 1. Genel İlkeler

- Minimum diff — sadece istenen kapsam
- İş kuralları: `@docs/BUSINESS.md` tek kaynak
- Her PR: test + review döngüsü

## 2. Repo Yapısı

```
[proje kök yapısı — backend/frontend ayrımı]
```

## 3. Backend (Java / Spring Boot)

- Paket yapısı: `[örn. com.example.order.application/domain/infrastructure]`
- DTO / Entity ayrımı
- Exception handling: `[GlobalExceptionHandler pattern]`
- Logging: structured, correlation ID

## 4. Frontend (Angular)

- Standalone components
- State: `[signals / NgRx / services]`
- API client: `[generated OpenAPI / manual]`
- Styling: `[design tokens path]`

## 5. Veritabanı

- Migration: Flyway/Liquibase — manuel SQL review
- Naming: `[snake_case tablolar]`
- Index: Database Optimizer önerilerine uy

## 6. Test

- Unit: [JUnit 5 / Jest-Karma]
- Integration: [Testcontainers / @SpringBootTest]
- Minimum coverage hedefi: [%X kritik path]

## 7. Git & PR

- Branch: `feature/TASK-ID-kisa-aciklama`
- Commit: conventional commits
- PR açıklaması: ne, neden, nasıl test edildi

## 8. Güvenlik

- `@kadikoy-senior-secops-engineer` standartları zorunlu
- Secret asla commit edilmez

## 9. Agent Kullanımı (KADIKOY)

- Büyük iş: `@kadikoy-master` + MASTER-START / SPRINT-CONTINUE
- Küçük iş: `prompts/MICRO-TASKS.md`
- Handoff: `@docs/HANDOFF.md` her oturum sonu
