# Değişiklik günlüğü — Raporlama

> Agent iş bitince kısa kayıt ekler. Sunum / retrospektif için.
> `@docs/8-CHANGELOG-raporlama.md`

---

## ORDER-NOTIFICATION-SYSTEM — 2026-06-05 (docker sorun giderme)

### Yapılanlar
- OPS: MySQL host port çakışması giderildi — varsayılan mapping 3307:3306 (yerel MySQL 3306 kullanıyordu, container başlamıyordu)
- OPS: `.env.example` ve conflict script güncellendi; full stack doğrulandı

### Dosyalar
- `docker-compose.yml`
- `.env.example`
- `scripts/ops-stop-local-conflicts.sh`

### Not
- Tüm 7 servis healthy; login + notifications API nginx üzerinden çalışıyor

---

## ORDER-NOTIFICATION-SYSTEM — 2026-06-05

### Yapılanlar
- OPS: `order-net` bridge network ile docker-compose altyapısı kuruldu
- OPS: MySQL (`order_db`), MongoDB (`notification_db`), Kafka KRaft (9092/29092) yapılandırıldı
- OPS: `oms.orders.v1` topic otomatik oluşturma (3 partition, RF=1)
- OPS: Nginx reverse proxy — `/api/v1/orders|auth` → order-service:8080, `/api/v1/notifications` → notification-service:8081, `/` → Angular dist
- OPS: GitHub Actions CI pipeline (JDK 25 + Node 21, maven + npm build)

### Dosyalar
- `docker-compose.yml`
- `.env.example`
- `nginx/conf.d/default.conf`
- `.github/workflows/ci-pipeline.yml`
- `scripts/ops-stop-local-conflicts.sh`

### Not
- MySQL container yerel host MySQL (3306) çakışması nedeniyle başlatılamadı; config hazır
- Push maddesi manuel — `push yap` komutu bekleniyor
- Sonraki: Master BE/FE task'ları, ardından mikroservis container'ları compose'a eklenmeli

---

<!-- Agent yeni sprint blokları üste ekler -->
