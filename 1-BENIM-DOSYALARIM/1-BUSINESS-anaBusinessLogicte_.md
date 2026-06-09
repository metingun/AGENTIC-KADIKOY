# ORDER-NOTIFICATION-SYSTEM — İş mantığı + teknoloji (cümleleriniz)

> Numara, epic yok. **Düz cümle** yazın.[cite: 1]
> İş kuralları, teknoloji, kütüphane ve operasyon ihtiyaçlarının **hepsi burada veya TASKS'ta** olabilir.[cite: 1]
> Agent `@docs/1-BUSINESS-anaBusinessLogicte*.md` okuyup anlar.[cite: 1]

---

## Uygulama ne yapacak?

- Kullanıcıların güvenli bir şekilde kimlik doğrulaması yaparak sisteme giriş yapabileceği, kendilerine ait siparişleri yönetebileceği ve sipariş işlemlerinin arka planda asenkron olarak izlenebildiği dağıtık bir sipariş yönetim platformu inşa ediyorsunuz.
- Müşteriler (Müşteri Rolü) sisteme giriş yaptıktan sonra sipariş formunu kullanarak yeni siparişler geçecek ve geçmiş sipariş listelerini inceleyebilecek.
- Sistem Yöneticileri (Admin Rolü) ise Notification Service üzerinden akan ve MongoDB'de saklanan asenkron bildirim loglarını, olay geçmişini ve sistem hareketlerini izleme ekranı üzerinden gerçek zamanlıya yakın takip edecek.

---

## Teknoloji ve stack (cümle olarak yazın)

- Frontend mimarisi Angular 21 sürümü kullanılarak tamamen Standalone Component yapısında, state yönetimi RxJS BehaviorSubject servisleri ile kurulmuş ve tasarım dili olarak Angular Material kütüphanesinin core bileşenleri (MatTable, MatCard, MatFormField, MatSnackBar) ile SCSS tabanlı tasarlanacaktır.
- Backend Core katmanı Java 25 LTS özellikleri (Record tipleri, pattern matching, geliştirilmiş switch ifadeleri) ve Spring Boot 3.4+ framework'ü kullanılarak iki bağımsız mikroservis (Order-Service ve Notification-Service) olarak geliştirilecektir.
- İşlemsel (Transactional) ve ilişkisel verilerin yönetimi için ACID standartlarında MySQL veritabanı kullanılacaktır.
- Yapılandırılmamış, esnek ve yüksek hacimli bildirim/audit loglarının saklanması ve hızlı indekslenmesi amacıyla MongoDB veritabanı tercih edilecektir.
- Servisler arası asenkron olay tabanlı (Event-Driven) iletişim, mesajların kaybolmaması ve gevşek bağlı (loosely coupled) bir mimari için Apache Kafka message broker yapısı kurulacaktır.
- İstemci isteklerinin tek bir noktadan güvenli yönlendirilmesi, CORS problemlerinin engellenmesi ve statik dosyaların sunumu için Nginx reverse proxy ve gateway katmanı olarak konumlandırılacaktır.
- Tüm altyapı bileşenleri, veri tabanları ve mikroservisler local geliştirme ortamında izole, network bağımlılıkları çözülmüş şekilde Docker ve docker-compose mimarisiyle tek bir script ile ayağa kalkacaktır.
- Kimlik doğrulama ve yetkilendirme işlemleri, güvenlik standartlarına uygun olarak asimetrik veya şifrelenmiş JWT token mimarisiyle, istemci tarafında XSS açıklarından korunmak amacıyla HttpOnly ve Secure işaretlenmiş Cookie'ler üzerinden taşınacaktır.
- Sürekli entegrasyon (CI) süreçleri için GitHub Actions kullanılacak; her Pull Request (PR) işleminde derleme kontrolü, statik kod analizi ve birim testlerin (JUnit 5, Mockito) otomatik koşması sağlanacaktır.

---

## İş kuralları

- Kullanıcı sistemi kullanmadan önce mutlaka geçerli kimlik bilgileriyle doğrulanmalıdır; kimlik doğrulaması başarısız olan istekler HTTP 401 Unauthorized hatası almalı ve login ekranına yönlendirilmelidir.
- Sipariş oluşturma esnasında ürün adı alanı boş bırakılamaz, minimum 3 karakter olmalı ve sipariş adedi 1 ile 100 arasında pozitif bir tam sayı olmak zorundadır.
- Bir sipariş başarıyla MySQL veritabanına yazılıp transaction commit edildikten hemen sonra, Kafka üzerindeki ilgili topic'e bir event fırlatılmalıdır; veri tabanı kaydı başarısız olursa Kafka'ya kesinlikle mesaj gitmemelidir (Transactional Outbox prensibi gözetilmelidir).
- Notification Service, Kafka'dan okuduğu her sipariş mesajını işlerken benzersiz sipariş ID'sini kontrol etmeli, mükerrer mesaj işleme (Idempotency) kuralına uymalı ve aynı sipariş için ikinci bir log üretmemelidir.
- Bildirim kayıtları MongoDB'ye yazılırken statü alanı varsayılan olarak "PENDING" kaydedilmeli, simüle edilen harici bildirim servisi tetiklendikten sonra başarı durumuna göre "SENT" veya "FAILED" olarak güncellenmelidir.
- Arayüz ekranlarında listelenen tüm veriler kronolojik olarak en yeni kayıt üstte görünecek şekilde sıralanmalıdır ve sayfalama (Pagination) altyapısına uygun mimaride tasarlanmalıdır.

---

## Yapılmayacaklar

- Gerçek bir e-posta veya SMS gönderim entegrasyonu (SMTP, Twilio vb.) yapılmayacak, bu süreçler notification servis içerisinde log basılarak simüle edilecektir.
- Kullanıcı kayıt olma (Sign-Up) veya şifre sıfırlama (Forgot Password) ekranları ve akışları bu mini projenin kapsamında yer almamaktadır; sistem önceden tanımlanmış seed kullanıcılar ile çalışacaktır.
- Çoklu dil desteği (i18n) uygulanmayacak, tüm arayüz ve hata mesajları Türkçe dilinde sabit olacaktır.