# ORDER-NOTIFICATION-SYSTEM — İş mantığı + teknoloji (cümleleriniz)

> Numara, epic yok. **Düz cümle** yazın.[cite: 1]
> İş kuralları, teknoloji, kütüphane ve operasyon ihtiyaçlarının **hepsi burada veya TASKS'ta** olabilir.[cite: 1]
> Agent `@docs/1-BUSINESS-anaBusinessLogicte*.md` okuyup anlar.[cite: 1]

---

## Uygulama ne yapacak?
- Yapay Zeka Destekli Akıllı Scrum/Kanban Asistanı ve Yönetim Paneli
Hedef: Geleneksel Scrum/Kanban süreçlerindeki sprint planlama ve raporlama iş yükünü optimize ederek, takımların tamamen "kod geliştirmeye" ve "değer üretmeye" odaklanmasını sağlamak.
1. Akıllı Planlama (Predictive Planning):
Jira backlog'undan seçilen task’ları ve size’larını okuyabilmeli. (Jira üzerinde bir yazma işlemi yapılmamalıdır, sadece okuma.)
Takımın geçmiş sprint verilerini (hız/velocity) analiz ederek, backlog’dan planlamaya dahil edilen yeni task’ların size’ları için objektif yapay zeka tahmini (Predictive Sizing) yapabilmeli.
Bonus: Task’ların bloklanma nedenlerine AI desteği için çözümler önerebilmeli.
2. Otomatik Görev Kırılımı ve Akıllı Atama (Task Decomposition):
Planlamaya dahil edilen bir task’ı saniyeler içinde mantıklı teknik alt görevlere (Frontend, Backend, DB, Test vb.) bölmeli.
Takım üyelerinin yetkinlik matrisine ve mevcut sprint yüklerine (kapasite) bakarak, görevleri en uygun kişilere akıllı eşleştirme ile en uygun atamayı önermeli.
Oluşturulan bu alt görevleri ve atama önerilerini rapor olarak sunabilmeli.
3. AI Sprint Review ve Yönetici Paneli (Dashboard):
"Bu Sprint Ne Başardık?" odaklı otomatik bir demo raporu ve özet metni üretmeli.
Planlanan vs. Gerçekleşen (Süre/Puan) sapma metriklerini görselleştiren bir dashboard sunmalı.
Bonus: Gerçekleştirilemeyen task’lar için sprint’ler arası geçişkenlik (sonraki sprint’lere kalma durumu) metriği hesaplamalı.
Bonus: Sprint için 1-100 skalasında sprint-health skoru hesaplamalı.

---

## Teknoloji ve stack (cümle olarak yazın)
- dockerdan order-service-1 ve notification-service-1 kaldırılacak. Portlar boşa çıkacak.
- Frontend angular 21 teknolojisi kullanılacak. Herhangi bir external library kullanılmayacak (angular material- bootstrap gibi). Pure css ve html ile md pancake temaya uygun olacak tüm ekranlar ve elementler.
- Backend java 25 , spring boot 3 versiyonlarını kullanacak. MongoDB, MySQL ve Kafka connection olacak. 
- 3 mikroservisli yapı istiyorum. 1-ScrumAssistantService, 2-ScrumAssistantSupportService, 3-ScrumAIService olarak 3 farklı servis olacak. 
- 1. serviste tüm projemin yönlendirmeleri olacak. 2. ve 3. servise istek atabilecek. Orada webflux ile istekler atabilmeliyiz. Bu yapıyı kurmalısın.
- Login role, claim yapısı bir custom annotation ile mysql den tablolardan cache yapılan veri üzerinden request permission izinleri anlaşılıp geçişe izin verilip verilmemesi sağlanacak.
- 1. serviste tüm ana rest servisler olacak. 2. serviste kafka ile topiclerden consume yapılarak uygulama loglarını mongodb ye yazacak. Tüm uygulamalar loglarını bu topicte toplayacak. Servis ve mikroservis detayları logda yazmalıdır.
- Gerekli tüm mongo mysql ve kafka elementlerini docker üzerinde oluşturmalıdır.
- ScrumAssistantService içerisinde https://github.com/metingun/response/blob/main/sprint.txt dosyasını düzenli olarak son halini alıp mongodb de bir collection içine insert edecek. Oradaki json veri yapısını alacak. Tek tek datalar olacak şekilde görünecek tek json olarak görünmesin.
- ScrumAssistantService içerisinde https://github.com/metingun/response/blob/main/backlog.txt dosyasını düzenli olarak son halini alıp mongodb de bir collection içine insert edecek. Oradaki json veri yapısını alacak. Tek tek datalar olacak şekilde görünecek tek json olarak görünmesin.
- Login olunca bir dashboard ekranı açılacak. Bunun detaylarını daha sonra yaptıracağım.
- Soldaki menüde Active Backlog seçeneği ile routing yapacak. o ekranda mongodb de backlog içerisinde bulunan tüm verileri tablo şeklinde temaya uygun search, filter vs. özellikleri ile beraber backend isteği ile pagination ile dolduracak. Tıklanınca popup ile detayları gösterilecek. AI ile Analiz et gibi bir buton olacak ve tıklanınca mevcutta listede bulunan taskların yanlarına analiz sonuçlarında çıkan değerleri popup şeklinde çıkarıp orada temaya uygun scroll ile gösterecek.
- Yapılandırılmamış, esnek ve yüksek hacimli bildirim/audit loglarının saklanması ve hızlı indekslenmesi amacıyla MongoDB veritabanı tercih edilecektir.
- Servisler arası asenkron olay tabanlı (Event-Driven) iletişim, mesajların kaybolmaması ve gevşek bağlı (loosely coupled) bir mimari için Apache Kafka message broker yapısı kurulacaktır.
- İstemci isteklerinin tek bir noktadan güvenli yönlendirilmesi, CORS problemlerinin engellenmesi ve statik dosyaların sunumu için Nginx reverse proxy ve gateway katmanı olarak konumlandırılacaktır.
- Tüm altyapı bileşenleri, veri tabanları ve mikroservisler local geliştirme ortamında izole, network bağımlılıkları çözülmüş şekilde Docker ve docker-compose mimarisiyle tek bir script ile ayağa kalkacaktır.
- Kimlik doğrulama ve yetkilendirme işlemleri, güvenlik standartlarına uygun olarak asimetrik veya şifrelenmiş JWT token mimarisiyle, istemci tarafında XSS açıklarından korunmak amacıyla HttpOnly ve Secure işaretlenmiş Cookie'ler üzerinden taşınacaktır.
- Kullanıcı kayıt olma (Sign-Up) veya şifre sıfırlama (Forgot Password) ekranları ve akışları bu projenin kapsamında yer almaktadır. Bunlar için de güzel bir ekran yapmalısın. images/image2 ve image3 ten ilham alarak temaya ters olmayacak şekilde ancak fotoğrafları da doğru şekilde kullanarak sign ve giriş ekranları oluşturulmalıdır.

---

## İş kuralları

- Kullanıcı sistemi kullanmadan önce mutlaka geçerli kimlik bilgileriyle doğrulanmalıdır; kimlik doğrulaması başarısız olan istekler HTTP 401 Unauthorized hatası almalı ve login ekranına yönlendirilmelidir.
- Notification Service, Kafka'dan okuduğu her sipariş mesajını işlerken benzersiz sipariş ID'sini kontrol etmeli, mükerrer mesaj işleme (Idempotency) kuralına uymalı ve aynı sipariş için ikinci bir log üretmemelidir.
- Bildirim kayıtları MongoDB'ye yazılırken statü alanı varsayılan olarak "PENDING" kaydedilmeli, simüle edilen harici bildirim servisi tetiklendikten sonra başarı durumuna göre "SENT" veya "FAILED" olarak güncellenmelidir.
- Arayüz ekranlarında listelenen tüm veriler kronolojik olarak en yeni kayıt üstte görünecek şekilde sıralanmalıdır ve sayfalama (Pagination) altyapısına uygun mimaride tasarlanmalıdır.
---

## Yapılmayacaklar

- Gerçek bir e-posta veya SMS gönderim entegrasyonu (SMTP, Twilio vb.) yapılmayacak, bu süreçler notification servis içerisinde log basılarak simüle edilecektir.

- Çoklu dil desteği (i18n) uygulanmayacak, tüm arayüz ve hata mesajları Türkçe dilinde sabit olacaktır.