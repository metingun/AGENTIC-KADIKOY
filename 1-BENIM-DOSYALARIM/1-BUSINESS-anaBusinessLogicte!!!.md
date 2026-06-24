# THEMIS PROJELERİ — İş mantığı + teknoloji

> **`*` son eki** = sizin düzenleyeceğiniz dosya.
> **KATMAN A** (Proje Kataloğu) dokunmayın — agent her seferinde okur.
> **KATMAN B** (Aktif Geliştirme) → her yeni iş için **siz** güncellersiniz; agent buradan görevi alır.
> Numara, epic yok. **Düz cümle veya maddeli liste** yazabilirsiniz.

---

## KATMAN A — PROJE KATALOĞU (Kalıcı — Dokunmayın)

> Bu bölüm tüm 3 projenin teknolojisini, mimari kurallarını ve kısıtlarını tanımlar.
> Agent, herhangi bir FE / BE / OPS isteği almadan önce bu bölümü okuyarak
> hangi proje, hangi stack, hangi kural geçerli olduğunu anlar.

---

### Proje 1 — Themis-Fe (AngularJS Frontend)

| Alan | Değer |
|------|-------|
| **Klasör** | `D:\TurkcellWorkspace\Frontend\Dönüşüm Frontend\Themis-Fe` |
| **Framework** | **AngularJS 1.8.2** (klasik, Angular 2+ DEĞİL) |
| **Dil** | **JavaScript ES5** — TypeScript KULLANILMAZ |
| **Build** | **Gulp 3.9.1** + npm; bağımlılıklar **Bower** üzerinden |
| **CSS** | **SCSS** → `rocket-engine/styles/` (UX Rocket design system) |
| **Template** | **Handlebars** (Gulp ile precompile edilir) |
| **Mimari** | `app/themis/` → `prelegal/` | `legal/` | `core/` | `brand/` |
| **Pattern** | MVC: controller + HTML template + route dosyası (`.route.js`) |
| **Multi-brand** | `turkcell`, `sol`, `tfs`, `dbs`, `tsatis` — `gulp run --brand <name>` |
| **Design system** | `rocket-engine/` — UX Rocket (kendi icon font + SCSS değişkenleri) |
| **Dev server** | Browser-sync (localhost:5000 proxy) |

**Zorunlu Kurallar — Themis-Fe:**
- ES6+ syntax KULLANILMAZ (`const`, `let`, `class`, arrow function, import/export yasak)
- TypeScript EKLENMEZ
- Bower bağımlılığı EKLENMEZ (yeni external lib yasak)
- Angular Material, Bootstrap gibi external UI lib yasak
- Yeni controller `app/themis/<modül>/controller/` altına, template `<modül>/template/` altına
- Route tanımı ilgili `.route.js` dosyasına eklenir
- Brand override: `app/themis/brand/template/<brand>/` altında brand-specific HTML override

---

### Proje 2 — Themis-TCELL (Java Backend — Ana Çekirdek)

| Alan | Değer |
|------|-------|
| **Klasör** | `D:\TurkcellWorkspace\Backend\ThemisProjects\Themis-TCELL` |
| **Dil** | **Java 1.7** |
| **Build** | **Maven** multi-module — 83 pom.xml modülü |
| **Framework** | **Spring 4.2.3.RELEASE** (XML IoC — annotation-based config KULLANILMAZ) |
| **Security** | Spring Security 4.0.3.RELEASE |
| **ORM** | **Hibernate 4.3.9.Final** |
| **Config** | `applicationContext-dao.xml`, `applicationContext-service.xml`, `applicationContext-security.xml`, `applicationContext-servlet.xml` |
| **Group ID** | `com.turkcelltech.themis` |
| **Deployment** | WAR → `Themis-Backend/` (REST/UI) + `Themis-Batch/` (batch jobs) |
| **Mimari** | `core/` (Domain→Utils→Core→Prelegal/Financial/Legal→Api→Engine) → `telco/` overlay → `tcell/`, `sol/`, `dbs/`, `tfs/`, `tsatis/`, `group/`, `banking/` brand modülleri |

**Zorunlu Kurallar — Themis-TCELL:**
- Spring Boot KULLANILMAZ; `@SpringBootApplication` EKLENMEZ
- Java 8+ feature KULLANILMAZ (`stream`, `lambda`, `Optional` yasak)
- Bean tanımları **XML** `applicationContext-*.xml` dosyasında yapılır
- `@Component`, `@Service`, `@Repository` annotation'ları KULLANILMAZ — XML bean tanımı zorunlu
- Yeni sınıf: mevcut katmanın paket yapısına göre doğru modüle eklenir
- Brand-specific kod: ilgili brand modülüne (`tcell/`, `sol/` vb.) eklenir
- Shared kod: `core/` modüle; brand override: brand modülüne

---

### Proje 3 — TLegal (Java Backend — Yasal Takip Middleware)

| Alan | Değer |
|------|-------|
| **Klasör** | `D:\TurkcellWorkspace\Backend\XLegal\TLegal` |
| **Dil** | **Java 1.7** |
| **Build** | **Maven** single-module — WAR (`finalName: TLEGAL`) |
| **Framework** | **Spring 3.0.5.RELEASE** (XML IoC — annotation-based config KULLANILMAZ) |
| **Security** | Spring Security 3.0.4–3.0.5 |
| **ORM** | **Hibernate 3.5.6-Final** |
| **Veritabanı** | **Oracle 10g** — dialect: `org.hibernate.dialect.Oracle10gDialect`, schema: `MW_TLEGAL` |
| **Scheduling** | **Quartz 2.2.1** (`quartz.properties`) |
| **JMS** | Spring JMS (listener context) |
| **REST** | Spring MVC DispatcherServlet `/rest/*` — `RestController-servlet.xml` |
| **App server** | WebLogic (`weblogic.xml`) |
| **Group ID** | `com.turkcelltech.tlegal` |
| **Paket yapısı** | `annotation/` | `dao/hibernate/` + `dao/integration/` | `domain/` | `enums/` | `factory/` | `filters/` | `handler/` | `jms/` | `job/` | `listeners/` | `mapper/` | `model/ws/` + `model/pojo/` | `service/impl/` + `service/dbcall/` + `service/wscall/rest/` | `utils/` | `webservice/` |

**Zorunlu Kurallar — TLegal:**
- Spring Boot KULLANILMAZ; `@SpringBootApplication` EKLENMEZ
- Java 8+ feature KULLANILMAZ
- Bean tanımları **XML** context dosyalarında (`applicationContext-dao/service/ui/listener/jms.xml`)
- `@Component`, `@Service`, `@Repository` annotation'ları KULLANILMAZ
- Oracle SQL sözdizimi kullanılır (MySQL/PostgreSQL syntax geçersiz)
- Yeni Quartz job: `job/` paketine + `quartz.properties`'e trigger eklenir
- Yeni webservice interface: `webservice/` altında mevcut interface pattern'ına göre
- Yeni REST endpoint: `service/wscall/rest/` controller'ına + `RestController-servlet.xml`'e mapping

---

### Hangi iş hangi projeye gider?

| Task prefix | Proje | Sekme |
|-------------|-------|-------|
| `FE-` | Themis-Fe (AngularJS) | `@kadikoy-master` |
| `BE-TCELL-` | Themis-TCELL (Java Spring 4) | `@kadikoy-master` |
| `BE-TLEGAL-` | TLegal (Java Spring 3) | `@kadikoy-master` |
| `OPS-` | Docker, CI, altyapı | `@kadikoy-ops` |

---

## KATMAN B — AKTİF GELİŞTİRME İSTEĞİ (Siz yazarsınız)

> Aşağıya her yeni özellik, bug fix veya performans isteğinizi yazın.
> **Hangi proje** ve **tür** belirtin; detayları madde madde veya paragraf olarak yazabilirsiniz.
> Agent bu bölümü okuyup `2-TASKS-araTasklarda*.md` dosyasına task olarak dönüştürür.

---

### Mevcut İstek
- Aşağıdaki tüm maddeler, interOfficeInfoFlow ekranı ile ilgili backend ve frontend bugfix (hata giderme) ve feature (yeni özellik) taleplerini içermektedir.

- listPreLegal rest request yerine /listByUserType request kullan ve oradan userType ile istek at.
- interOfficeInfoFlow ekranında hukuk bürosu kolonu ve değerlerinde hukuk bürosu ID si geliyor adının gelmesi için gerekli geliştirme veya kontrolleri gerçekleştir.

- Bunlar sonucunda test kodlarını da gerekli noktalarda düzelt.                
*(Tamamlandı — yeni istek için buraya yazın)*

---

