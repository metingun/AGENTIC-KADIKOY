# ORDER-NOTIFICATION-SYSTEM — Ops kuyruğu

> **Siz yazarsınız** — `OPS-` ile başlayan cümleler or düz ops cümlesi.[cite: 3]
> `@kadikoy-ops` bu dosyayı okur. FE/BE işleri `2-TASKS-araTasklarda*.md` dosyasında.[cite: 3]

---

## Yapılacaklar

<!-- tüm OPS maddeleri tamamlandı (push manuel) -->

---

## Bitti

- ✓ Ayakta olmayan ve servislerin çalışmasını engelleyecek bir ayar varsa docker içerisinde inceleyip düzeltir misin?
- ✓ OPS- Projenin kök dizininde tüm servisleri bağlayacak `order-net` adında bir bridge network içeren `docker-compose.yml` dosyası hazırla.
- ✓ OPS- MySQL container'ını ayarla; port 3306, veritabanı adı `order_db`, root şifresi `VaultPass123!`, kullanıcı adı `db_user` ve şifresi `UserPass123!` olacak şekilde environment tanımlarını yap ve verilerin kalıcı olması için local volume (`mysql_data`) bağla.
- ✓ OPS- MongoDB container'ını ayarla; port 27017, veritabanı adı `notification_db`, root kullanıcı adı `mongo_admin`, şifresi `MongoPass123!` olacak şekilde yapılandır ve local volume (`mongo_data`) tanımla.
- ✓ OPS- KRaft modunda çalışan tek bir Apache Kafka container'ı ayağa kaldır; port 9092 iç iletişim, port 29092 dış iletişim için ayarlansın; başlangıçta otomatik olarak `oms.orders.v1` adında, 3 partition ve 1 replication factor'e sahip bir topic oluşturan komutları ekle.
- ✓ OPS- Nginx container'ını ayarla; port 80 üzerinden gelen istekleri dinlesin; `/api/v1/orders` ve `/api/v1/auth` isteklerini `http://order-service:8080` adresine, `/api/v1/notifications` isteklerini ise `http://notification-service:8081` adresine reverse proxy kuralları ile yönlendirsin; kök dizin `/` isteklerini ise Angular build çıktısının bulunduğu dizine yönlendirecek `nginx.conf` dosyasını hazırla.
- ✓ OPS- GitHub Actions workflow dosyası oluştur; `.github/workflows/ci-pipeline.yml` altında JDK 25 ve Node.js 21 ortamlarını kurup, maven clean package ve npm run build komutlarını testleri çalıştırarak koşturacak pipeline'ı tanımla.

---

## Manuel (siz "push yap" deyince de olur)

- push yap → commit + GitHub push[cite: 3]
- OPS- Proje iskeletleri tamamlandığında tüm konfigürasyonları içeren ilk stabil commit'i `feat: infrastructure and docker configuration completed` mesajıyla ana branch'e pushla.
