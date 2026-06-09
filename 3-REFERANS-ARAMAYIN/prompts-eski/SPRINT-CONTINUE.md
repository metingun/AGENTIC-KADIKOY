# KADIKOY — Sprint / Yeni Talimat Devam Promptu

Yeni iş veya sprint için. Önceki oturum bittiyse **yeni Agent chat** açın.

---

## Tam pipeline gerekmiyorsa (önerilen — düşük maliyet)

```
@kadikoy-master
@docs/HANDOFF.md
@docs/BUSINESS.md
@docs/REQUIREMENTS.md
@docs/CONSTRAINTS.md
@docs/ACCEPTANCE.md

Yeni sprint/talimat: [NE YAPILACAK — 2-5 cümle]

Maliyet modu: SADECE etkilenen fazları çalıştır.
- Faz 0 (Prompt Engineer): [evet — belirsiz istek / hayır — doküman hazır]
- Faz 1 (Product Manager): [evet / hayır — gereksinim zaten @docs/REQUIREMENTS.md'de]
- Faz 2 (Mimari): [evet / hayır]
- Faz 3 (Altyapı): [evet / hayır]
- Faz 4 (Geliştirme): [evet — task listesi aşağıda]
- Faz 5 (Sertifikasyon): [evet / hayır — sadece teslim öncesi]

Faz 4 task'ları (sırayla, tek tek):
1. [TASK-ID] [açıklama] — agent: [frontend / backend]
2. [TASK-ID] [açıklama]

Her task: Dev → @kadikoy-code-reviewer → @kadikoy-minimal-change-engineer → @kadikoy-api-tester [+ @kadikoy-evidence-collector UI ise]

Task bitince @docs/HANDOFF.md ve @docs/CHANGELOG.md güncelle.
İnsan onayı gereken yerde DUR.

Başla.
```

---

## Küçük iş (tek feature / bug)

```
@kadikoy-prompt-engineer

Ham istek: [TALİMATINIZ]
Hedef: @kadikoy-[backend-architect / frontend-developer / minimal-change-engineer]

Prompt'u yapılandır, sonra ilgili agent ile implement et.
Review: @kadikoy-code-reviewer → @kadikoy-minimal-change-engineer
Test: @kadikoy-api-tester
@docs/HANDOFF.md güncelle.
```

---

## Oturum devamı (aynı chat, context dolmadan)

```
@kadikoy-master
@docs/HANDOFF.md

HANDOFF §2 sıradaki task ile devam et.
Önceki faz onayları geçerli. Faz 4 döngüsünü uygula.
```
