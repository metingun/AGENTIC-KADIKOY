# KADIKOY — Ana Başlangıç Promptu

Cursor'da `@kadikoy-master` seçtikten sonra aşağıdaki bloğu kopyalayıp yapıştırın.
`[...]` alanlarını doldurun.

---

```
@kadikoy-master

KADIKOY-AGENTS ekibini NEXUS-Kadıköy modunda aktive et.

## Proje
- Ad: [PROJE ADI]
- Açıklama: [NE İNŞA EDİYORUZ — 2-3 cümle]
- İş mantığı özeti: [KRİTİK DOMAIN KURALLARI]
- Spec dosyaları: @docs/BUSINESS.md @docs/REQUIREMENTS.md @docs/CONSTRAINTS.md @docs/ACCEPTANCE.md
  (henüz yoksa: ./KADIKOY-AGENTS/scripts/init-project-docs.sh çalıştırın)

## Teknoloji
- Frontend: Angular [sürüm, örn. 19]
- Backend: Java Spring Boot [sürüm, örn. 3.x]
- Veritabanı: [PostgreSQL / MySQL]
- Mesajlaşma: [Kafka — evet/hayır, hangi event'ler]
- Mimari tercih: [Monolit / Mikroservis / Karar verilsin]
- Altyapı: Docker + docker-compose + nginx + GitHub Actions

## Güvenlik
- Auth: JWT (HttpOnly Secure SameSite cookie)
- Roller: [ADMIN, USER, ...]
- Hassas veriler: [KVKK/GDPR gereksinimleri varsa belirt]

## Kabul Kriterleri
- [ ] Angular UI — responsive, erişilebilir, tasarım sistemi uyumlu
- [ ] Java API — OpenAPI spec, versioning, hata kodları standart
- [ ] DB — migration'lar, index stratejisi, rollback planı
- [ ] Kafka — (varsa) idempotent consumer, dead-letter queue
- [ ] Docker — local dev tek komutla ayağa kalkar
- [ ] CI/CD — PR'da test + lint + security scan
- [ ] JWT — Senior SecOps kurallarına uygun
- [ ] Test — unit + integration test suite
- [ ] Dokümantasyon — kullanım kılavuzu + guideline + API docs
- [ ] Rapor — Executive Summary ile proje çıktısı

## Pipeline Talimatı

Agents Orchestrator olarak şu fazları sırayla yürüt:

**Faz 0 — Prompt Hazırlığı**
→ @kadikoy-prompt-engineer: bu isteği yapılandırılmış agent promptlarına çevir
→ @kadikoy-autonomous-optimization-architect: agent/model seçimi, token bütçesi belirle

**Faz 1 — Keşif & Planlama**
→ @kadikoy-product-manager: PRD + user story + kabul kriterleri üret

**Faz 2 — Mimari**
→ @kadikoy-software-architect: monolit/mikroservis kararı + ADR
→ @kadikoy-backend-architect: API contract, servis sınırları, paket yapısı
→ @kadikoy-ux-architect + @kadikoy-ui-designer: tasarım sistemi + wireframe
→ @kadikoy-database-optimizer: ER diyagramı + migration planı

**Faz 3 — Altyapı**
→ @kadikoy-devops-automator: Dockerfile, docker-compose, nginx, GitHub Actions
→ @kadikoy-senior-secops-engineer: JWT/auth mimarisi, env secret politikası
→ @kadikoy-data-engineer: (Kafka gerekiyorsa) topic tasarımı + consumer/producer

**Faz 4 — Geliştirme (Dev↔Review↔Fix↔QA döngüsü)**
Her task için:
  1. @kadikoy-frontend-developer veya @kadikoy-backend-architect implement eder
  2. @kadikoy-code-reviewer sorunları tespit eder (🔴 blocker / 🟡 suggestion / 💭 nit)
  3. @kadikoy-minimal-change-engineer bulguları minimum diff ile düzeltir
  4. @kadikoy-api-tester + @kadikoy-evidence-collector doğrular
  5. Auth değişikliği varsa @kadikoy-senior-secops-engineer onaylar
  FAIL → max 3 retry, sonra escalate

**Faz 5 — Sertifikasyon & Teslim**
→ @kadikoy-reality-checker: production-ready sertifikasyon
→ @kadikoy-technical-writer: kullanım kılavuzu, guideline, README, API docs
→ @kadikoy-executive-summary-generator: yönetici raporu

## Davranış Kuralları
- Direktif veya logic tutarsızlığı görürsen DUR, uyar ve düzeltme öner
- Kanıt olmadan "tamamlandı" deme
- Minimum diff — sadece istenen kapsam
- Gereksiz agent çağrısı ve token israfından kaçın
- Her faz sonunda handoff özeti ver (dosya yolları, riskler, açık maddeler)

Her faz sonunda DUR — insan onayı bekle (şablon: prompts/FAZ-ONAY.md).
Her faz/task sonunda @docs/HANDOFF.md ve @docs/CHANGELOG.md güncelle.

Şimdi Faz 0 ile başla. Faz 0 bitince dur, onay bekle.
```
