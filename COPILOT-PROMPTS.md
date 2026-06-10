# GitHub Copilot — KADIKOY Prompt Şablonları

> VS Code Copilot Chat'te kopyala-yapıştır. `#file` ile dosya ekle veya chat'e sürükle.
> Workspace: `kadikoy.code-workspace` | Kurulum: `./KADIKOY-AGENTS/install-copilot.sh`

---

## 1. Genel başlatma (Master)

```
KADIKOY Master protokolünü uygula.

Önce oku:
- docs/4-HANDOFF-agentYazar.md (Orchestrator State)
- docs/2-TASKS-araTasklarda*.md (ilk tamamlanmamış FE-/BE- satırı)
- docs/1-BUSINESS-anaBusinessLogicte*.md
- KADIKOY-AGENTS/2-SISTEM/agent-routing.md

Kurallar:
- Tek seferde yalnızca bir Orchestrator adımı ilerlet
- Her yanıtta "## [Orchestrator] Adım N/M" bloğu üret
- Adım bitince docs/4-HANDOFF-agentYazar.md Orchestrator State güncelle
- QA pass olmadan task ✓ işaretleme

devam
```

---

## 2. Sıradaki task (devam)

```
docs/4-HANDOFF ve docs/2-TASKS oku.

Sıradaki tamamlanmamış FE- veya BE- task'ı al. OPS- satırlarını atla.
Orchestrator pipeline'ı tek adım ilerlet; kod değişikliği yalnızca o adımın specialist rolüne uygunsa yap.

Çıktı formatı:
1. Hangi task ve hangi adım
2. ## [Orchestrator] Adım N/M bloğu
3. Yapılan iş / karar
4. Güncellenmiş Orchestrator State (HANDOFF için)

devam
```

---

## 3. FE task (UI / Angular)

```
FE task pipeline başlat.

Zorunlu okuma:
- KADIKOY-AGENTS/1-BENIM-DOSYALARIM/PANCAKE-DASHBOARD-THEME.md
- KADIKOY-AGENTS/2-SISTEM/agent-routing.md (Master FE pipeline)

Sıra: Prompt Engineer → UI Designer → UX Architect → Frontend Developer → Code Reviewer → Evidence → SecOps

Şu an hangi adımdaysak yalnızca onu yap. Pancake tema dışı renk/font yasak.
Adım bitince HANDOFF güncelle.

Task: [buraya FE cümlesini yapıştır veya "docs/2-TASKS'tan al"]
```

---

## 4. BE task (Java / Spring)

```
BE task pipeline başlat.

Zorunlu okuma:
- docs/1-BUSINESS-anaBusinessLogicte*.md
- KADIKOY-AGENTS/2-SISTEM/agent-routing.md (Master BE pipeline)

Sıra: Prompt Engineer → (PM) → (Architect) → Backend Architect → (DB) → (Data Eng) → Code Reviewer → API Tester → SecOps

Secret/credential commit etme. GenericApiResponse<T> sözleşmesine uy.
Adım bitince HANDOFF güncelle.

Task: [buraya BE cümlesini yapıştır veya "docs/2-TASKS'tan al"]
```

---

## 5. Ops (Docker / CI / deploy)

```
KADIKOY Ops kanalı. channel: OPS

Önce oku:
- docs/3-OPS-QUEUE-opsKuyrugunda*.md (ilk tamamlanmamış OPS- satırı)
- docs/4-HANDOFF-agentYazar.md
- KADIKOY-AGENTS/2-SISTEM/agent-routing.md (Ops pipeline)

Kapsam: docker-compose.yml, nginx/, .github/workflows/, Dockerfile*
docs/2-TASKS FE/BE koduna dokunma.

Tek adım ilerlet; HANDOFF + CHANGELOG güncelle.

devam
```

---

## 6. Pancake tema denetimi (QA)

```
Pancake Dashboard tema QA yap.

Kaynak: KADIKOY-AGENTS/1-BENIM-DOSYALARIM/PANCAKE-DASHBOARD-THEME.md

Kontrol listesi:
- [ ] Kanit font (DM Sans / Roboto yok)
- [ ] --primary #1FC7D4, --secondary #7645D9 token'ları
- [ ] Hard-coded hex yok (mümkün olduğunca)
- [ ] [data-theme="light|dark"] çalışıyor
- [ ] Admin sayfalarında sidebar + topbar shell
- [ ] Kart radius 24px (--radius-card)
- [ ] index.html FOUC script var

ExampleFrontend/src altını tara; sapmaları listele ve minimum diff ile düzelt.
```

---

## 7. Tek adım ilerlet (sıkışmış pipeline)

```
HANDOFF'taki Orchestrator State'e bak. current_step'te takılı kaldık.

Yalnızca mevcut adımı tamamla — sonraki adıma geçme.
Adım done olunca HANDOFF'ta steps[N].status = done yap ve current_step +1.

Blocked ise blocked_reason yaz; kod yazma.

Mevcut adım: [ör. 3 - Frontend Developer]
```

---

## 8. Task tamamlandı (kapat)

```
Aktif task tamamlandı sayılıyor. Şunları yap:

1. docs/2-TASKS-araTasklarda*.md → ilgili satırı ✓ işaretle (Bitti bölümüne taşı)
2. KADIKOY-AGENTS/1-BENIM-DOSYALARIM/2-TASKS-araTasklarda*.md → aynı senkron
3. docs/4-HANDOFF-agentYazar.md → qa_status: pass, özet güncelle
4. docs/8-CHANGELOG-raporlama.md → kısa kayıt ekle
5. Sırada yeni task var mı bildir

Build doğrula: FE ise npm run build, BE ise mvn clean package
```

---

## 9. Proje bitir (sprint kapanışı)

```
proje bitir — PROJE_BITIR pipeline

Oku:
- docs/5-ACCEPTANCE-projeSonunda.md
- docs/6-USER-GUIDE-sunumIcin.md
- docs/7-GUIDELINES-projeSonunda.md
- KADIKOY-AGENTS/2-SISTEM/agents/testing-reality-checker.md

Reality Checker ile PASS/NEEDS WORK kararı ver.
Eksikse doldur; HANDOFF + CHANGELOG güncelle.
```

---

## 10. Hata ayıklama (build kırık)

```
Build hatası var. Minimum diff ile düzelt.

FE: cd ExampleFrontend && npm run build
BE: cd ExampleBackend && mvn clean package -DskipTests

Hata logunu analiz et; Pancake tema / Orchestrator state / unrelated refactor yapma.
Düzeltme sonrası build'i tekrar çalıştır ve sonucu bildir.
```

---

## 11. Yeni task ekle (kullanıcı)

```
Yeni task ekleyeceğim. Şimdilik kod yazma.

docs/2-TASKS-araTasklarda*.md dosyasının "Yapılacaklar" bölümüne şu satırı ekle:
[TASK CÜMLENİZ — FE- veya BE- veya OPS- önekli]

KADIKOY-AGENTS/1-BENIM-DOSYALARIM/2-TASKS dosyasını da senkronize et.
HANDOFF Orchestrator State'i yeni task için sıfırla.
```

---

## 12. Git response çek

```
git response çek

Oku: KADIKOY-AGENTS/1-BENIM-DOSYALARIM/10-GIT-RESPONSE-gitResponseCek*.md
Çalıştır: bash KADIKOY-AGENTS/2-SISTEM/scripts/git-response-pull.sh
Oku: KADIKOY-AGENTS/1-BENIM-DOSYALARIM/response-json.txt
Kullanıcıya JSON özetini ver (key, summary, status).
FE/BE/OPS task dosyalarına dokunma.
```

---

## İpuçları

| İpucu | Açıklama |
|-------|----------|
| `#file` | Copilot Chat'te dosya referansı (ör. `#file:docs/4-HANDOFF-agentYazar.md`) |
| Agent modu | Uzun pipeline için Copilot **Agent** modunu aç; terminal komutları çalıştırabilir |
| Tek adım | Copilot çok adım atlar — "yalnızca adım N" diye sıkılaştır |
| Cursor paralel | Cursor'da `@kadikoy-master` + `devam` aynı işi yapar |

---

## Hızlı referans

| İstediğin | Prompt # |
|-----------|----------|
| İlk açılış | 1 |
| Sıradaki iş | 2 |
| UI işi | 3 |
| API işi | 4 |
| Docker/CI | 5 |
| Tema kontrolü | 6 |
| Takılı pipeline | 7 |
| Task kapat | 8 |
| Sprint bitir | 9 |
| Build fix | 10 |
