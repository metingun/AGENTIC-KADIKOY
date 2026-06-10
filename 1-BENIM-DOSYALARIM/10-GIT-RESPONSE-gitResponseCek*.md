# Git Response Çek — Jira export JSON

> **Komut:** `git response çek` veya `@kadikoy-git-response`
> Agent bu dosyayı okur ve aşağıdaki döngüyü çalıştırır.

---

## Ne yapar?

1. GitHub **`metingun/response`** reposunu `git pull` ile günceller
2. **`response.txt`** dosyasını okur
3. İçindeki **`--- HAM SONUC ---`** bloğundaki JSON'u ayıklar
4. Sonucu şuraya yazar: **`1-BENIM-DOSYALARIM/response-json.txt`**

---

## Kaynak

| Alan | Değer |
|------|-------|
| Repo | `https://github.com/metingun/response` |
| Branch | `main` |
| Dosya | `response.txt` |
| JSON bloğu | `--- HAM SONUC ---` ile `--- META ---` arası |

---

## Çalıştırma

```bash
bash KADIKOY-AGENTS/2-SISTEM/scripts/git-response-pull.sh
```

---

## Çıktı

- **JSON dosyası:** `KADIKOY-AGENTS/1-BENIM-DOSYALARIM/response-json.txt`
- **Cache (git clone):** `KADIKOY-AGENTS/.cache/response-repo/` (gitignore)

---

## Agent davranışı

`git response çek` dediğinizde agent:

1. Script'i çalıştırır (veya aynı adımları manuel uygular)
2. `response-json.txt` içeriğini gösterir / özetler
3. Hata varsa (repo erişimi, JSON yok) net mesaj verir

**Tekrar:** Her `git response çek` komutunda önce pull, sonra JSON çıkarımı yapılır.
