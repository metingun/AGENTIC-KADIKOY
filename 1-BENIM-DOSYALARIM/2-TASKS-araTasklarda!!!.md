# THEMIS PROJELERİ — Yapılacaklar

> Her satır bir iş. **Önek zorunlu** → agent hangi projeye gideceğini önek'ten anlar.
>
> | Önek | Proje | Kanal |
> |------|-------|-------|
> | `FE-` | Themis-Fe (AngularJS 1.8) | `@kadikoy-master` |
> | `BE-TCELL-` | Themis-TCELL (Java 7 / Spring 4 XML) | `@kadikoy-master` |
> | `BE-TLEGAL-` | TLegal (Java 7 / Spring 3 XML / Oracle) | `@kadikoy-master` |
> | `OPS-` | Docker, CI, altyapı | `3-OPS-QUEUE` → `@kadikoy-ops` |

---

## Yapılacaklar (üstten alta)

---

## Bitti
- [x] BE-TCELL-002: CommunicationService.tlegalInkaWebServiceCall → @Autowired(required=false) + null guard in enrichScreenListWithSuperboxFlag; diğer brandlar için no-op davranış sağlandı
- [x] FE-002: customer-card.html {{customerCardTitle || 'Müşteri Kartı'}} fallback doğrulandı — diğer brandlar için güvenli
- [x] BE-TEST: TLegal ve Themis-TCELL yeni sınıfları için unit testler yazıldı + sonar bulguları düzeltildi
- [x] BE-TLEGAL-001: TLegalInkaController + InkaProductQueryClient oluştur — PRODUCT_QUERY_SERVICE_WS (SOAP) üzerinden getProductDetailWithCustomerByMsisdn metodunu çağır; paymentType=76 ise superbox abonesi; request/response model'leri oluştur; Constants'a PRODUCT_QUERY_SERVICE_WS ve PRODUCT_QUERY_SERVICE_WS_TIMEOUT ekle
- [x] BE-TCELL-001: CommunicationService.getEplInvoices (Themis-TCELL core) — isInCallList=1 olan unique msisdn'ler için TLegal InkaController'a REST isteği at; isSuperboxCustomer flag'ini EplInvoiceScreenDto'ya ekle; transaction yönetimini bozmadan yalnızca TCELL projesinde devreye gir
- [x] FE-001: Themis-Fe turkcell brand customer_card_faturalar.html — Contract Statü ile Arama Listesinde kolonları arasına Superbox Abonesi kolonu ekle (ng-if="brand=='turkcell'"); isSuperboxCustomer=1 ise faturalar içinde herhangi biri varsa popup göster; customer-card.html'de Müşteri Kartı başlığını Müşteri Kartı (Superbox Abonesi) yap (ng-if="brand=='turkcell' && hasSuperboxCustomer")
- [x] BE-TLEGAL-002: InkaProductQueryClient baştan yaz — productQuery JAR JAX-WS stublarını kullan (ProductQuery_Service/ProductQuery port); CustomerRelationWebServiceImpl pattern ile port lifecycle yönetimi; SecureWebService/SecureWsUtil ApiGW entegrasyonu; manuel HTTP/XML parsing kaldırıldı
*(Önceki Scrum Assistant sprint task'ları 8-CHANGELOG'da kayıtlı)*

---

## Önek Referans

| Önek | Sekme | Stack hatırlatma |
|------|-------|-----------------|
| `FE-` | `@kadikoy-master` | AngularJS 1.8 / ES5 / Gulp / UX Rocket |
| `BE-TCELL-` | `@kadikoy-master` | Java 7 / Spring 4.2 XML / Hibernate 4 / Maven multi-module |
| `BE-TLEGAL-` | `@kadikoy-master` | Java 7 / Spring 3.0 XML / Hibernate 3.5 / Oracle 10g |
| `OPS-` | `@kadikoy-ops` | Docker, CI/CD, nginx, altyapı |
