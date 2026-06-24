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

- [x] BE-TCELL-001: Hukuk bürosu popup filtresi — sadece PRELEGAL_STATUS=1 olan bürolar getirilmeli
- [x] BE-TCELL-002: Talepler listesi sorgusu — sadece prelegal statüsü aktif olanlar listelenmeli
- [x] BE-TCELL-003: Subject (konu) alanı max 300 karakter backend validasyonu
- [x] BE-TCELL-004 (kısmi): Expire Days max 30 gün üst sınırı validasyonu eklendi; süresi dolunca otomatik iptal + mail batch job ayrı task olarak açıldı
- [x] BE-TCELL-005: Subject arama case-insensitive — FE'de zaten `toLocaleLowerCase('tr-TR')` kullanılıyor, ek değişiklik gerekmedi
- [x] BE-TCELL-006: Prelegal kullanıcı response fix — `getMailToList` NPE giderildi, `lawOfficeName` null-safe yapıldı
- [x] BE-TCELL-007: İptal aksiyonunda ana statü güncellenmesi — BE-TCELL-006 fix'iyle çözüldü (createRequest artık SUCCESS döner → updateRequest çağrılır)
- [x] BE-TCELL-008: Unit test güncellemeleri — mevcut non-central mock'lar güncellendi, yeni validasyon testleri eklendi
- [x] FE-001: "Yeni Talep Oluştur" butonu sadece Merkez rolünde — zaten `ng-show="... && central"` ile implement edilmişti
- [x] FE-002: Subject (konu) alanı max 300 karakter frontend validasyonu eklendi
- [x] BE-TCELL-009: Expire Days süresi dolunca otomatik "İptal Edildi" + Merkez kullanıcılara mail — `listRequests` içinde `expireOverdueRequests` + `createMailLog("Expire")` ile implement edildi

- [x] FE-003: `loadLawOffices` endpoint değişikliği — `listPrelegal` → `listByUserType`, response key `prelegalLawOffices` → `lawOffices`; listede ID yerine isim görünmesi sağlandı

---

## Bitti

*(Önceki Scrum Assistant sprint task'ları 8-CHANGELOG'da kayıtlı)*

---

## Önek Referans

| Önek | Sekme | Stack hatırlatma |
|------|-------|-----------------|
| `FE-` | `@kadikoy-master` | AngularJS 1.8 / ES5 / Gulp / UX Rocket |
| `BE-TCELL-` | `@kadikoy-master` | Java 7 / Spring 4.2 XML / Hibernate 4 / Maven multi-module |
| `BE-TLEGAL-` | `@kadikoy-master` | Java 7 / Spring 3.0 XML / Hibernate 3.5 / Oracle 10g |
| `OPS-` | `@kadikoy-ops` | Docker, CI/CD, nginx, altyapı |
