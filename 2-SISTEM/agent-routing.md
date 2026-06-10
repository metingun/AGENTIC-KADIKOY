# KADIKOY Agent Routing — Otomatik Yönlendirme Matrisi

> **Otorite:** `@kadikoy-agents-orchestrator` pipeline'ı yönetir; Master/Ops yalnızca protokolü uygular.
> **State:** `@docs/4-HANDOFF-agentYazar.md` → `## Orchestrator State` (adım geçişi buradan doğrulanır)
> Kullanıcı agent adı **belirtmez**; Orchestrator task tipine göre `agents/` altındaki 20 uzmanı sırayla devreye sokar.

---

## Global kancalar (her oturum, her prompt okuma/yazma)

| Sıra | Agent | Ne zaman | Görev |
|:---:|-------|----------|-------|
| G1 | **Prompt Engineer** `@kadikoy-prompt-engineer` | BUSINESS, TASKS, OPS-QUEUE, HANDOFF veya kullanıcı mesajı okunmadan/yazılmadan önce | Belirsiz cümleleri yapılandır; agent brief'leri üret; çıktı formatını netleştir |
| G2 | **Autonomous Optimization Architect** `@kadikoy-autonomous-optimization-architect` | G1 ile birlikte; her dış API/LLM çağrısında | Token/model bütçesi, retry cap, timeout, circuit breaker limitleri |

---

## Task sınıflandırma (otomatik)

| Önek / sinyal | Tip | Ana kanal |
|---------------|-----|-----------|
| `FE-` | Frontend | Master |
| `BE-` | Backend | Master |
| `OPS-` | Altyapı | Ops |
| UI, ekran, component, sayfa, form, Angular | Frontend | Master |
| API, endpoint, servis, entity, Kafka, DB | Backend | Master |
| docker, nginx, CI, deploy, migration infra | Ops | Ops |

---

## Master — FE- task pipeline (sıra zorunlu)

Kullanıcı ne derse desin, **FE-** veya UI içeren her task bu sırayı izler.

> **Zorunlu tema:** `@KADIKOY-AGENTS/1-BENIM-DOSYALARIM/PANCAKE-DASHBOARD-THEME.md` + `@kadikoy-pancake-theme` — tüm HTML/CSS/UI bu temaya göre. Override yalnızca kullanıcı açıkça isterse.

> **Forma estetik DNA** (`ux-developer.md` birleştirildi): UI Designer = vizyon, UX Architect = mimari brief, Frontend Developer = kod. Generic "AI slop" yasak.

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

| Adım | Agent | Görev | Atlama |
|:---:|-------|-------|--------|
| 0 | Prompt Engineer + Optimization Architect | Task brief hazırla | Asla |
| 1 | **Product Manager** | Gereksinim belirsiz veya yeni domain kuralı varsa netleştirir | Net gereksinimde atla |
| 2 | **Software Architect** | Yeni modül, servis sınırı, ADR, monolit/mikroservis kararı | Küçük bugfix'te atla |
| 3 | **Backend Architect** | API, servis, domain kodu | Asla |
| 4 | **Database Optimizer** | Şema, migration, index, sorgu | DB yoksa atla |
| 5 | **Data Engineer** | Kafka, event, ETL, stream pipeline | Mesajlaşma yoksa atla |
| 6 | **Code Reviewer** | İnceleme | Asla |
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
