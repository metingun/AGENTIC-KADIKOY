# docs/ Şablonları

`init-project-docs.sh` bu dosyaları proje kökündeki `docs/` altına kopyalar.

## Günlük kullanım (2 kanal)

| Dosya | Kim okur | Ne yazarsınız |
|-------|----------|---------------|
| `BUSINESS.md` | Master | **Büyük** iş süreçleri, kurallar, state machine |
| `TASKS.md` | Master | **Küçük** maddeler — feature işleri |
| `OPS-QUEUE.md` | Ops (`@kadikoy-ops`) | Docker, MySQL, MongoDB, Kafka, nginx, git, deploy |
| `CONSTRAINTS.md` | Her ikisi | Stack (MySQL, MongoDB, Kafka, nginx) |
| `HANDOFF.md` | Her ikisi | Agent günceller — iki kanal durumu |

## Ara sıra / proje sonu

| Dosya | Amaç |
|-------|------|
| `REQUIREMENTS.md` | Epic/user story (büyük modül başında) |
| `ACCEPTANCE.md` | Teslim checklist |
| `CHANGELOG.md` | Değişiklik günlüğü |
| `GUIDELINES.md` | Kod standartları (proje sonu) |
| `USER-GUIDE.md` | Kullanım kılavuzu (proje sonu) |

## Cursor promptları

- Günlük: `prompts/DAILY-WORKFLOW.md`
- Master: `prompts/MASTER-DAILY.md`
- Ops: `prompts/OPS-START.md`
- Bitiş: `prompts/PROJECT-FINISH.md`
