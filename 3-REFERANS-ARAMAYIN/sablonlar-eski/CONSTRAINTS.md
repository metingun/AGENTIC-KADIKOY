# [PROJE ADI] — Teknik Kısıtlar ve Kararlar

> Mimari ve teknik sınırlar. `@docs/CONSTRAINTS.md`

## 1. Teknoloji Yığını (sabit)

| Katman | Teknoloji | Sürüm | Not |
|--------|-----------|-------|-----|
| Frontend | Angular | [19] | Standalone components |
| Backend | Java Spring Boot | [3.x] | — |
| İlişkisel DB | MySQL | [8.x] | Birincil transactional veri |
| Doküman DB | MongoDB | [7.x] | Log, cache, esnek şema ihtiyacı (gerekiyorsa) |
| Mesajlaşma | Apache Kafka | [evet] | Event-driven |
| Reverse proxy | nginx | [latest] | Frontend + API yönlendirme |
| Cache | [Redis / yok] | — | — |
| Auth | JWT | HttpOnly cookie | `@kadikoy-senior-secops-engineer` kuralları |
| Konteyner | Docker + docker-compose | — | Local dev tek komut |

---

## 2. Mimari Karar

| Karar | Seçim | Gerekçe |
|-------|-------|---------|
| Deployment modeli | [Monolit / Mikroservis / Modular monolith] | [kısa gerekçe] |
| API stili | [REST / GraphQL] | — |
| API versioning | [URL prefix `/api/v1`] | — |
| DB migration | [Flyway / Liquibase] | — |

**ADR referansları:** `docs/adr/ADR-001.md` (oluşturulacak)

---

## 3. Güvenlik Kısıtları

- JWT secret: **sadece** environment variable, startup'ta yoksa fail
- Token storage: **HttpOnly; Secure; SameSite=Lax** cookie — localStorage yasak
- Roller: `[ADMIN, USER, ...]`
- Hassas veri: [KVKK/GDPR — maskeleme, retention süresi]
- Rate limit: [örn. 100 req/dk/IP auth endpoint]

---

## 4. Altyapı Kısıtları

- Local dev: `docker compose up` tek komut
- Reverse proxy: nginx
- CI/CD: GitHub Actions — PR'da lint + test + security scan zorunlu
- Ortamlar: `dev`, `staging`, `prod`
- Secret yönetimi: [.env.local gitignore, prod'da vault/CI secrets]

---

## 5. Kod ve Repo Kuralları

- Branch: `main` (korunan), `feature/*`, `fix/*`
- Commit: conventional commits (`feat:`, `fix:`, `docs:`)
- PR: en az 1 review (Code Reviewer döngüsü)
- Test: yeni feature → unit + integration test zorunlu
- Minimum diff: scope creep yasak

---

## 6. Performans ve Ölçek

| Metrik | Hedef |
|--------|-------|
| API p95 latency | < [300] ms |
| Angular LCP | < [2.5] s |
| DB connection pool | max [20] |
| Kafka consumer lag | < [1000] ms |

---

## 7. Agent / LLM Maliyet Kısıtları

- Tam pipeline sadece **yeni modül / mimari değişiklik** için
- Küçük fix → `MICRO-TASKS` şablonları
- Context: `@docs/` dosyaları referans; sohbete uzun metin yapıştırma yok
- Faz bazlı insan onayı zorunlu

---

## 8. Yasaklar (Must NOT)

- [ ] Hardcoded secret / API key
- [ ] JWT in localStorage
- [ ] Raw SQL string concatenation
- [ ] Breaking API change without version bump
- [ ] Production deploy without Reality Checker PASS
