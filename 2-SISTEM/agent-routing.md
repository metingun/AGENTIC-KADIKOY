# KADIKOY Agent Routing — Otomatik Yönlendirme Matrisi

> **Otorite:** `@kadikoy-agents-orchestrator` pipeline'ı yönetir; Master/Ops yalnızca protokolü uygular.
> **State:** `@KADIKOY-AGENTS/1-BENIM-DOSYALARIM/4-HANDOFF-agentYazar.md` → `## Orchestrator State` (adım geçişi buradan doğrulanır)
> Kullanıcı agent adı **belirtmez**; Orchestrator task tipine göre `agents/` altındaki 20 uzmanı sırayla devreye sokar.

---

## Global kancalar (her oturum, her prompt okuma/yazma)

| Sıra | Agent | Ne zaman | Görev |
|:---:|-------|----------|-------|
| G1 | **Prompt Engineer** `@kadikoy-prompt-engineer` | BUSINESS, TASKS, OPS-QUEUE, HANDOFF veya kullanıcı mesajı okunmadan/yazılmadan önce | Belirsiz cümleleri yapılandır; agent brief'leri üret; çıktı formatını netleştir |
| G2 | **Autonomous Optimization Architect** `@kadikoy-autonomous-optimization-architect` | G1 ile birlikte; her dış API/LLM çağrısında | Token/model bütçesi, retry cap, timeout, circuit breaker limitleri |

---

## Task sınıflandırma (otomatik)

| Önek / sinyal | Tip | Proje | Ana kanal |
|---------------|-----|-------|-----------|
| `FE-` | Frontend | Themis-Fe (AngularJS 1.8 / ES5 / Gulp) | Master |
| `BE-TCELL-` | Backend | Themis-TCELL (Java 7 / Spring 4.2 XML / Hibernate 4 / Maven multi-module) | Master |
| `BE-TLEGAL-` | Backend | TLegal (Java 7 / Spring 3.0 XML / Hibernate 3.5 / Oracle 10g) | Master |
| `BE-` | Backend (proje belirsiz — BUSINESS KATMAN A'dan çıkar) | Master |
| `OPS-` | Altyapı | Docker, CI/CD, nginx | Ops |
| UI, ekran, component, sayfa, form, AngularJS | Frontend | Themis-Fe | Master |
| servis, entity, DB, Oracle, Quartz, JMS | Backend | BUSINESS KATMAN A'dan belirle | Master |
| docker, nginx, CI, deploy, migration infra | Ops | — | Ops |

> **Proje bağlamı:** `BE-TCELL-` veya `BE-TLEGAL-` prefix'i yoksa Backend Architect,
> `@KADIKOY-AGENTS/1-BENIM-DOSYALARIM/1-BUSINESS-anaBusinessLogicte*.md` →
> **KATMAN A — PROJE KATALOĞU** bölümünü okuyarak hedef projeyi ve stack kısıtlarını belirler.

---

## Master — FE- task pipeline (sıra zorunlu)

Kullanıcı ne derse desin, **FE-** veya UI içeren her task bu sırayı izler.

> **⚠️ LEGACY JS KURAL HATIRLATMASI (Themis-Fe için zorunlu):**
> Frontend Developer adımında, kod yazmadan önce `1-BUSINESS` → **KATMAN A** okunur.
> - **AngularJS 1.8** (klasik MVC) — Angular 2+ / React / Vue KULLANILMAZ
> - **JavaScript ES5** — `const`, `let`, `class`, arrow function, `import/export`, TypeScript YASAK
> - Bower bağımlılığı / yeni external kütüphane EKLENMEZ
> - Controller: `app/themis/<modül>/controller/`, Template: `<modül>/template/`, Route: `.route.js`
> - CSS: UX Rocket SCSS değişkenleri (`rocket-engine/styles/`) kullanılır
> - Brand override: `app/themis/brand/template/<brand>/` klasörüne

> **Tema:** Themis-Fe kendi UX Rocket design system'ini kullanır. Pancake Dashboard teması yalnızca sıfırdan yeni projeler içindir — Themis-Fe için UX Rocket tokenları geçerlidir.

> **Forma estetik DNA:** UI Designer = vizyon, UX Architect = mimari brief, Frontend Developer = kod. Generic "AI slop" yasak.

| Adım | Agent | Görev | Atlama |
|:---:|-------|-------|--------|
| 0 | Prompt Engineer + Optimization Architect | Task brief hazırla; **Pancake tema MD oku** | Asla |
| 1 | **UI Designer** | Estetik Vizyon = **Pancake Dashboard** token'ları (🎯🎨🔤✨) | Asla |
| 2 | **UX Architect** | CSS/component mimarisi, animasyon spec, UX Implementasyon Brief | Asla |
| 3 | **Frontend Developer** | Vizyon + brief'e sadık production kod (Angular/React/CSS) | Asla |
| 4 | **Code Reviewer** | Doğruluk, güvenlik, performans incelemesi | Asla |
| 5 | **Minimal Change Engineer** | Review bulgularını minimum diff ile düzeltir | FAIL varsa |
| 6 | **API Tester** | İlgili API endpoint'leri varsa test eder | API yoksa atla |
| 7 | **Evidence Collector** | UI screenshot kanıtı, 3–5 issue taraması | Asla (UI task) |
| 8 | **Senior SecOps Engineer** | Auth/rol/PII/token değişikliği varsa onay | Auth yoksa tarama only |

**QA döngüsü:** Adım 6–7 FAIL → Adım 5 → tekrar 6–7 (max 3 deneme).

---

## Master — BE- task pipeline (sıra zorunlu)

> **⚠️ LEGACY JAVA KURAL HATIRLATMASI (BE-TCELL- ve BE-TLEGAL- için zorunlu):**
> Backend Architect adımında, kod yazmadan önce `1-BUSINESS` → **KATMAN A** okunur.
> - Spring Boot / `@SpringBootApplication` / `@Component` / `@Service` / `@Repository` KULLANILMAZ
> - Java 8+ özelliği (stream, lambda, Optional, var, record) KULLANILMAZ
> - Bean tanımları `applicationContext-*.xml` (Spring XML IoC) ile yapılır
> - BE-TCELL-: Maven multi-module; yeni sınıf doğru modüle (core / telco / brand) eklenir
> - BE-TLEGAL-: Oracle SQL sözdizimi; Quartz job için `quartz.properties` + XML context güncellenir

| Adım | Agent | Görev | Atlama |
|:---:|-------|-------|--------|
| 0 | Prompt Engineer + Optimization Architect | Task brief hazırla; **1-BUSINESS KATMAN A oku** → hedef proje + stack kısıtları | Asla |
| 1 | **Product Manager** | Gereksinim belirsiz veya yeni domain kuralı varsa netleştirir | Net gereksinimde atla |
| 2 | **Software Architect** | Yeni modül, servis sınırı, ADR; monolit katman kararı (microservice öneremez) | Küçük bugfix'te atla |
| 3 | **Backend Architect** | Hedef projenin XML IoC + Java 7 kurallarına uygun API / servis / domain kodu | Asla |
| 4 | **Database Optimizer** | Şema, migration, index, sorgu (Oracle için Oracle syntax zorunlu) | DB yoksa atla |
| 5 | **Data Engineer** | JMS / Kafka event pipeline (sadece TLegal JMS veya mevcut Kafka varsa) | Mesajlaşma yoksa atla |
| 6 | **Code Reviewer** | İnceleme — Java 7 uyumu + XML config eksiği + Spring Boot kaçağı kontrol | Asla |
| 7 | **Minimal Change Engineer** | Düzeltme | FAIL varsa |
| 8 | **API Tester** | Endpoint, contract, performans testi | Asla |
| 9 | **Senior SecOps Engineer** | Secret taraması + auth değişikliği onayı | Her submission'da tarama |

**QA döngüsü:** Adım 8 FAIL → Adım 7 → tekrar 8 (max 3 deneme).

---

## Master — Proje başı (ilk task veya BUSINESS'ta yeni modül)

| Sıra | Agent | Görev |
|:---:|-------|-------|
| 1 | Product Manager | BUSINESS cümlelerini user story + kabul kriterlerine çevir |
| 2 | Software Architect | Stack + mimari karar özeti (ADR) |
| 3 | UX Architect + UI Designer | Global tasarım sistemi (FE task'larından önce bir kez) |

---

## Ops — OPS- task pipeline (sıra zorunlu)

| Adım | Agent | Görev | Atlama |
|:---:|-------|-------|--------|
| 0 | Prompt Engineer + Optimization Architect | OPS brief hazırla | Asla |
| 1 | **DevOps Automator** | Docker, CI/CD, nginx, deploy, infra kodu | Asla |
| 2 | **Senior SecOps Engineer** | Secret, env, header, HTTPS, pipeline güvenlik gate | Asla |
| 3 | **Database Optimizer** | DB container, migration infra, index | DB yoksa atla |
| 4 | **Data Engineer** | Kafka/Zookeeper, topic, consumer infra | Stream yoksa atla |
| 5 | **API Tester** | Health check, smoke test | Deploy/CI varsa |
| 6 | **Reality Checker** | Infra gerçekten çalışıyor mu (build + compose + health) | Büyük deploy'da |

---

## `proje bitir` pipeline (Master)

| Sıra | Agent | Çıktı dosyası |
|:---:|-------|---------------|
| 1 | Prompt Engineer + Optimization Architect | Brief netleştirme |
| 2 | **Reality Checker** | PASS/NEEDS WORK → HANDOFF |
| 3 | **API Tester** | Son API smoke suite |
| 4 | **Evidence Collector** | UI screenshot seti (eksikse tamamla) |
| 5 | **Technical Writer** | `5-ACCEPTANCE`, `6-USER-GUIDE`, `7-GUIDELINES` |
| 6 | **Executive Summary Generator** | HANDOFF'a yönetici özeti |
| 7 | Master | `8-CHANGELOG` sprint özeti, `4-HANDOFF` final |

---

## Özel komutlar (Ops)

| Komut | Agent sırası |
|-------|--------------|
| `push yap` | SecOps (secret scan) → DevOps (commit+push) |
| `deploy yap` | DevOps → SecOps → API Tester → Reality Checker → HANDOFF |

---

## İnsan onayı — sadece şu durumlarda dur

- QA 3 deneme sonra hâlâ FAIL
- Belirsiz gereksinim (Product Manager netleştiremedi)
- Mimari çatışma (Software Architect ADR kararı)
- Auth/güvenlik SecOps reddi
- Deploy/production riski

---

## Agent → Cursor rule eşlemesi

| Agent | Cursor rule |
|-------|-------------|
| Agents Orchestrator | `@kadikoy-agents-orchestrator` |
| Product Manager | `@kadikoy-product-manager` |
| Software Architect | `@kadikoy-software-architect` |
| UX Architect | `@kadikoy-ux-architect` |
| UI Designer | `@kadikoy-ui-designer` |
| Frontend Developer | `@kadikoy-frontend-developer` |
| Backend Architect | `@kadikoy-backend-architect` |
| Database Optimizer | `@kadikoy-database-optimizer` |
| Data Engineer | `@kadikoy-data-engineer` |
| DevOps Automator | `@kadikoy-devops-automator` |
| Senior SecOps Engineer | `@kadikoy-senior-secops-engineer` |
| Minimal Change Engineer | `@kadikoy-minimal-change-engineer` |
| Code Reviewer | `@kadikoy-code-reviewer` |
| API Tester | `@kadikoy-api-tester` |
| Evidence Collector | `@kadikoy-evidence-collector` |
| Reality Checker | `@kadikoy-reality-checker` |
| Technical Writer | `@kadikoy-technical-writer` |
| Executive Summary Generator | `@kadikoy-executive-summary-generator` |
| Prompt Engineer | `@kadikoy-prompt-engineer` |
| Autonomous Optimization Architect | `@kadikoy-autonomous-optimization-architect` |
