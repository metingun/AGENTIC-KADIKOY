# ORDER-NOTIFICATION-SYSTEM — Yapılacaklar

> Her satır bir iş. Önek: `FE-` `BE-` `OPS-`
> Agent `@docs/2-TASKS-araTasklarda*.md`

---

## Yapılacaklar (üstten alta)

*(Kuyruk boş — tüm FE/BE maddeleri tamamlandı.)*

---

## Bitti

### GENERİK MİMARİ & ALTYAPI (BACKEND)
- ✓ BE- `GenericApiResponse<T>` record (`common` modülü)
- ✓ BE- Global Exception Handler (`@RestControllerAdvice`)
- ✓ BE- SLF4J Logback JSON konfigürasyonu

### DATABASE ŞEMALARI & ENTITY TANIMLARI
- ✓ BE- `users` tablosu + `User` entity
- ✓ BE- `orders` tablosu + `Order` entity
- ✓ BE- `ddl-auto=update` + `import.sql` seed kullanıcılar
- ✓ BE- `notification_logs` MongoDB document

### AUTHENTICATION & SECURITY (ORDER SERVICE)
- ✓ BE- Spring Security `SecurityFilterChain`
- ✓ BE- `JwtProvider` (1 saat, username + roles claims)
- ✓ BE- `POST /api/v1/auth/login` (HttpOnly cookie)
- ✓ BE- `POST /api/v1/auth/logout`
- ✓ BE- `JwtAuthenticationFilter`

### ORDER BUSINESS LOGIC & KAFKA PRODUCER
- ✓ BE- `POST /api/v1/orders`
- ✓ BE- SecurityContext userId bağlama
- ✓ BE- Kafka producer + `oms.orders.v1`
- ✓ BE- Kafka event payload
- ✓ BE- `GET /api/v1/orders`

### NOTIFICATION LOGIC & KAFKA CONSUMER
- ✓ BE- MongoDB + Kafka consumer config
- ✓ BE- `@KafkaListener` consumer
- ✓ BE- Idempotency kontrolü
- ✓ BE- PENDING → simülasyon → SENT akışı
- ✓ BE- `GET /api/v1/notifications`

### FRONTEND ALTYAPI
- ✓ FE- Angular 21 + Material + ReactiveForms
- ✓ FE- `withCredentials` interceptor
- ✓ FE- 401 unauthorized interceptor
- ✓ FE- `AuthGuard`

### EKRANLAR
- ✓ FE- Login ekranı (4 madde)
- ✓ FE- Sipariş yönetimi ekranı (4 madde)
- ✓ FE- Admin bildirim izleme ekranı (4 madde)

### TEST
- ✓ BE- `OrderBusinessLogicTest`
- ✓ BE- `NotificationProcessorTest` (duplicate idempotency)

### UI/UX DUAL TEMA (Aimm image2 + image3)
- ✓ FE- 2 tema + toggle (Light clay / Dark charcoal)
- ✓ FE- Landing, Login, Orders, Notifications — `_themes.scss` token'ları

### KULLANICI BİLGİLERİ
- ✓ Seed kullanıcılar: `customer_user` / `admin_user` (şifre: `password`) — `docs/4-HANDOFF` Giriş bilgileri tablosu

---

## Önekler

| Önek | Sekme |
|------|-------|
| `FE-` | `@kadikoy-master` |
| `BE-` | `@kadikoy-master` |
| `OPS-` | `3-OPS-QUEUE-opsKuyrugunda*.md` → `@kadikoy-ops` |
