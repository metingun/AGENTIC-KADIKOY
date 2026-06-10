# SCRUM-ASSISTANT — Yapılacaklar

> Her satır bir iş. Önek: `FE-` `BE-` `OPS-`
> Agent `@docs/2-TASKS-araTasklarda*.md`

---

## Yapılacaklar (üstten alta)

### ALTYAPI (OPS — @kadikoy-ops)
- [x] OPS- docker-compose'dan order-service-1, notification-service-1 kaldır; 8080-8081 portlarını boşalt
- [x] OPS- docker-compose'a scrum-assistant-service (8080), scrum-support-service (8081), scrum-ai-service (8082) ekle; nginx upstream'lerini güncelle; Kafka topic scrum.app.logs.v1 oluştur

### BACKEND — PROJE İSKELETİ
- [x] BE-01: 3 Spring Boot projesi + common modülü scaffold et: Maven multi-module (scrum-parent → common, scrum-assistant-service:8080, scrum-support-service:8081, scrum-ai-service:8082); temel pom.xml bağımlılıkları
- [x] BE-02: common modülde `GenericApiResponse<T>` record, `GlobalExceptionHandler` (@RestControllerAdvice, Türkçe mesajlar), SLF4J Logback JSON layout konfigürasyonu

### BACKEND — AUTH & GÜVENLİK
- [x] BE-03: MySQL şema: `users`, `roles`, `permissions`, `user_roles`, `role_permissions` tabloları; JPA entity'leri; `import.sql` seed (admin_user + customer_user, şifre: password); ddl-auto=update
- [x] BE-04: Asimetrik RSA JWT: `JwtProvider` (RS256, 1 saat, username+roles claim), HttpOnly+Secure cookie transport, `JwtAuthenticationFilter`, `SecurityFilterChain` (stateless session)
- [x] BE-05: `@RequiresPermission` custom annotation + `PermissionCacheService` (MySQL permissions → Caffeine cache, TTL 5dk) + AOP `@Around` interceptor; `POST /api/v1/auth/login`, `POST /api/v1/auth/logout`

### BACKEND — VERİ KATMANI & FETCH
- [x] BE-06: MongoDB: `SprintData` document (sprint.txt JSON yapısına göre), `BacklogItem` document (backlog.txt JSON yapısına göre); MongoRepository'ler; index tanımları
- [x] BE-07: ScrumAssistantService: GitHub sprint.txt scheduled fetch (@Scheduled cron 5dk) → tekil `SprintData` upsert (MongoDB, mükerrer önle)
- [x] BE-08: ScrumAssistantService: GitHub backlog.txt scheduled fetch → tekil `BacklogItem` upsert (MongoDB, mükerrer önle)

### BACKEND — REST API
- [x] BE-09: `GET /api/v1/backlog` (Pageable, filter: status/assignee/sprint, sort: createdAt desc) + `GET /api/v1/sprint` (Pageable)
- [x] BE-10: `WebClient` bean (ScrumAssistantService → ScrumAIService, reactive, circuit breaker + timeout); ScrumAIService: `POST /api/v1/ai/analyze` (BacklogItem listesi → size tahmini + risk skoru + öneri, rule-based stub)

### BACKEND — KAFKA LOG ALTYAPISI
- [x] BE-11: Kafka log topic `scrum.app.logs.v1`: tüm servislerde `KafkaProducer` log appender (servis adı + level + timestamp + mesaj + requestId)
- [x] BE-12: ScrumAssistantSupportService: Kafka consumer `scrum.app.logs.v1` → MongoDB `app_logs` collection; idempotency (messageId unique index)

### FRONTEND — İSKELET & TEMA
- [x] FE-01: Angular 21 scaffold: standalone components, routing, `withCredentials` HTTP interceptor, 401→/login interceptor, `AuthGuard`; pure CSS Pancake tema token sistemi (cyan #1FC7D4, purple #7645D9)

### FRONTEND — AUTH EKRANLARI
- [x] FE-02: Login ekranı: split-layout (sol form, sağ Aimm 3D karakter görseli — image2 light/image3 dark ilham); pancake tema; HttpOnly cookie auth; form validasyonu
- [x] FE-03: Sign-Up ve Forgot Password ekranları: aynı split-layout + 3D karakter; form validasyonu; BE endpoint entegrasyonu

### FRONTEND — ANA LAYOUT & EKRANLAR
- [x] FE-04: Ana uygulama layout: collapsible sidebar (Active Backlog, Sprint), topbar (kullanıcı bilgisi, logout); router-outlet; pancake tema
- [x] FE-05: Active Backlog ekranı: backend pagination tablo (search, filter by status/assignee, sort), satır tıklama → popup detay; kronolojik (en yeni üstte)
- [x] FE-06: Active Backlog AI analiz: "AI ile Analiz Et" butonu → ScrumAIService POST → analiz sonuçları satır yanlarına pancake tema uyumlu overlay/scroll ile göster
- [x] FE-07: Dashboard ekranı: sprint health skoru gauge (pure CSS, 1-100), planlanan vs gerçekleşen metrik kartları, velocity trend bar chart (pure CSS)

---

## Bitti

*(Önceki ORDER-NOTIFICATION-SYSTEM sprint tamamlandı — tüm geçmiş task'lar docs/8-CHANGELOG'da)*

---

## Önekler

| Önek | Sekme |
|------|-------|
| `FE-` | `@kadikoy-master` |
| `BE-` | `@kadikoy-master` |
| `OPS-` | `3-OPS-QUEUE-opsKuyrugunda*.md` → `@kadikoy-ops` |
