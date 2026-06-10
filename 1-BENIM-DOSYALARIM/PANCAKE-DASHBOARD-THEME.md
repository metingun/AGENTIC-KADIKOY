# Pancake DeFi Dashboard Theme — Generic Design System

> **Kaynak proje:** `examples/api-tester.html`, `examples/bot-console.html`  
> **Tema adı (önerilen):** `pancake-dashboard` veya `defi-cyan-purple`  
> **Stil:** Light/Dark dual theme, sidebar + topbar app shell, cyan primary + purple secondary, subtle SVG pattern overlay, card-based UI.

Bu doküman, başka bir workspace’e kopyalanıp “bu temayı uygula” denildiğinde agent veya geliştiricinin tüm görsel sistemi birebir kurabilmesi için hazırlanmıştır.

---

## 1. Tema felsefesi

Bu tema bir **dashboard / admin panel** için tasarlanmıştır:

- **Primary (cyan `#1FC7D4`)** → aksiyon, focus, aktif toggle, CTA butonları
- **Secondary (purple `#7645D9`)** → navigasyon aktif durumu, vurgu, badge, section title
- **Arka plan** → düz renk + gradient wash + tekrarlayan SVG pattern (derinlik hissi)
- **Kartlar** → yuvarlak köşe (24px), ince border, hafif gölge, pattern overlay
- **Formlar** → uppercase micro-label, 1.5px border, focus’ta cyan glow ring
- **Responsive** → desktop’ta collapsible sidebar; mobilde off-canvas drawer + overlay

Başka projeye uygularken **tüm renkleri CSS custom property üzerinden** kullan; hard-coded hex’ten kaçın.

---

## 2. Kurulum (zorunlu head içeriği)

### 2.1 Font

```html
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
```

### 2.2 FOUC önleme (tema flash’ını engelle)

`<head>` içinde, CSS’ten **önce** inline script:

```html
<script>
  (function () {
    var t = localStorage.getItem("app-theme"); // key'i projeye göre değiştir
    document.documentElement.setAttribute("data-theme", t || "light");
  })();
</script>
```

Kaynak projede kullanılan key: `api-tester-theme-v2`

### 2.3 HTML root

```html
<html lang="tr" data-theme="light">
```

Tema değişimi: `document.documentElement.setAttribute("data-theme", "dark"|"light")` + `localStorage`.

---

## 3. Design tokens (CSS variables)

### 3.1 Light theme — `:root, [data-theme="light"]`

```css
:root, [data-theme="light"] {
  /* Brand */
  --primary: #1FC7D4;
  --primary-dark: #0098A1;
  --primary-bright: #53DEE9;
  --primary-light: #E5FDFF;

  --secondary: #7645D9;
  --secondary-light: rgba(118, 69, 217, 0.12);
  --accent: #7645D9;
  --accent-light: rgba(118, 69, 217, 0.12);

  /* Semantic */
  --success: #31D0AA;
  --error: #ED4B9E;
  --warning: #FFB237;

  /* Surfaces */
  --bg: #FAF9FA;
  --bg2: #FFFFFF;
  --surface: #FFFFFF;
  --border: #E7E3EB;
  --text: #280D5F;
  --muted: #7A6EAA;

  /* Code blocks */
  --code-bg: #191326;
  --code-text: #E5FDFF;

  /* Layout */
  --sidebar-w: 300px;
  --sidebar-collapsed-w: 76px;

  /* Shape */
  --radius: 16px;
  --radius-card: 24px;
  --shadow: 0px 2px 12px -8px rgba(25, 19, 38, 0.1), 0px 1px 1px rgba(25, 19, 38, 0.05);
  --glow: rgba(31, 199, 212, 0.35);

  /* Gradients */
  --gradient-page: linear-gradient(139.73deg, rgba(229, 253, 255, 0.55) 0%, rgba(243, 239, 255, 0.55) 100%);
  --gradient-btn: linear-gradient(180deg, #1FC7D4 0%, #0098A1 100%);
  --gradient-btn-hover: linear-gradient(180deg, #53DEE9 0%, #1FC7D4 100%);

  /* Typography */
  --font-display: "Kanit", sans-serif;
  --font-body: "Kanit", sans-serif;

  /* Pattern */
  --pattern-tile: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='320' height='320' viewBox='0 0 320 320'%3E%3Cg fill='none' stroke='%237645D9' stroke-width='2.7' opacity='0.1'%3E%3Ccircle cx='70' cy='70' r='52'/%3E%3Ccircle cx='250' cy='210' r='68'/%3E%3Ccircle cx='155' cy='285' r='34'/%3E%3Cpath d='M-10 150 Q90 90 180 150 T350 125'/%3E%3Cpath d='M20 290 Q130 210 240 270 T340 250'/%3E%3C/g%3E%3Cg fill='none' stroke='%231FC7D4' stroke-width='2.1' opacity='0.07'%3E%3Ccircle cx='260' cy='55' r='38'/%3E%3Ccircle cx='95' cy='248' r='42'/%3E%3Cpath d='M35 35 Q115 95 205 48'/%3E%3C/g%3E%3C/svg%3E");
  --pattern-tile-size: 320px 320px;
}
```

### 3.2 Dark theme — `[data-theme="dark"]`

```css
[data-theme="dark"] {
  --primary: #1FC7D4;
  --primary-dark: #0098A1;
  --primary-bright: #53DEE9;
  --primary-light: rgba(31, 199, 212, 0.14);

  --secondary: #9A6AFF;
  --secondary-light: rgba(154, 106, 255, 0.14);
  --accent: #9A6AFF;
  --accent-light: rgba(154, 106, 255, 0.14);

  --success: #31D0AA;
  --error: #ED4B9E;
  --warning: #FFB237;

  --bg: #08060B;
  --bg2: #27262c;
  --surface: #27262c;
  --border: #383241;
  --text: #F4EEFF;
  --muted: #B8ADD2;

  --code-bg: #100C18;
  --code-text: #E5FDFF;

  --shadow: 0px 2px 12px -8px rgba(0, 0, 0, 0.45), 0px 1px 1px rgba(0, 0, 0, 0.2);
  --glow: rgba(31, 199, 212, 0.28);
  --gradient-page: linear-gradient(139.73deg, rgba(49, 61, 92, 0.35) 0%, rgba(61, 42, 84, 0.35) 100%);
  --gradient-btn: linear-gradient(180deg, #1FC7D4 0%, #0098A1 100%);
  --gradient-btn-hover: linear-gradient(180deg, #53DEE9 0%, #1FC7D4 100%);

  --pattern-tile: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='320' height='320' viewBox='0 0 320 320'%3E%3Cg fill='none' stroke='%239A6AFF' stroke-width='2.5' opacity='0.09'%3E%3Ccircle cx='70' cy='70' r='52'/%3E%3Ccircle cx='250' cy='210' r='68'/%3E%3Ccircle cx='155' cy='285' r='34'/%3E%3Cpath d='M-10 150 Q90 90 180 150 T350 125'/%3E%3Cpath d='M20 290 Q130 210 240 270 T340 250'/%3E%3C/g%3E%3Cg fill='none' stroke='%2353DEE9' stroke-width='1.9' opacity='0.06'%3E%3Ccircle cx='260' cy='55' r='38'/%3E%3Ccircle cx='95' cy='248' r='42'/%3E%3Cpath d='M35 35 Q115 95 205 48'/%3E%3C/g%3E%3C/svg%3E");
}
```

---

## 4. Global reset & body katmanları

```css
*, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

body {
  font-family: var(--font-body);
  background: var(--bg);
  color: var(--text);
  min-height: 100vh;
  overflow: hidden; /* app shell — scroll workspace içinde */
}

/* Katman 1: gradient wash */
body::before {
  content: "";
  position: fixed;
  inset: 0;
  background: var(--gradient-page);
  pointer-events: none;
  z-index: 0;
}

/* Katman 2: pattern + radial glows */
body::after {
  content: "";
  position: fixed;
  inset: 0;
  pointer-events: none;
  z-index: 0;
  opacity: 0.34;
  background-image:
    var(--pattern-tile),
    radial-gradient(ellipse 80% 60% at 10% 20%, rgba(31, 199, 212, 0.07), transparent 55%),
    radial-gradient(ellipse 70% 50% at 90% 80%, rgba(118, 69, 217, 0.06), transparent 50%);
  background-size: var(--pattern-tile-size), 100% 100%, 100% 100%;
}

[data-theme="dark"] body::after {
  opacity: 0.26;
  background-image:
    var(--pattern-tile),
    radial-gradient(ellipse 80% 60% at 10% 20%, rgba(31, 199, 212, 0.05), transparent 55%),
    radial-gradient(ellipse 70% 50% at 90% 80%, rgba(154, 106, 255, 0.07), transparent 50%);
}

.layout {
  display: flex;
  height: 100vh;
  position: relative;
  z-index: 1;
}
```

---

## 5. Tipografi ölçeği

| Kullanım | Font | Boyut | Ağırlık | Ek |
|----------|------|-------|---------|-----|
| Brand başlık | `--font-display` | `1.35rem` | 800 | `letter-spacing: -0.04em` |
| Topbar başlık | `--font-display` | `1.35rem` | 800 | `letter-spacing: -0.03em` |
| Card header | `--font-display` | `0.9rem` | 700 | |
| Field label | body | `0.68rem` | 700 | `uppercase`, `letter-spacing: 0.05em`, `color: var(--muted)` |
| Body / input | body | `0.875rem` | 500 | |
| Nav item | body | `0.98rem` | 500 (active: 600) | |
| Micro badge | body | `0.72rem` | 700 | pill shape |
| Table header | body | `0.68–0.74rem` | 700 | uppercase |

**Renk kuralı:** başlıklar `var(--text)`, ikincil metin `var(--muted)`, vurgu kelimeler `var(--secondary)` (`<em>` ile brand’de).

---

## 6. Spacing & grid sistemi

Temel ritim: **8px grid** (8, 10, 12, 14, 16, 18, 20, 24).

| Token | Değer | Kullanım |
|-------|-------|----------|
| Card body padding | `18px` | `.card-body` |
| Card header padding | `14px 18px` | `.card-header` |
| Workspace padding | `16px 20px` (mobil: `12px`) | `.workspace` |
| Field grid gap | `14px` | `.fields` |
| Button row gap | `10px` | `.btn-row` |
| Border radius input | `9–10px` | input, btn |
| Border radius card | `24px` (`--radius-card`) | `.card` |
| Border kalınlığı | `1.5px` | input, btn-ghost, icon-btn |

### Form grid

```css
.fields {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(170px, 1fr));
  gap: 14px;
}
```

Bot console geniş alan span sınıfları (6 kolon grid):

- `.field-w-xs` → 1 kolon
- `.field-w-sm` / `.field-w-md` → 2 kolon
- `.field-w-lg` → 3 kolon
- `.field-w-full` → tam satır

### İki kolon layout

```css
.columns {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20px;
  align-items: start;
}
```

---

## 7. App shell HTML iskeleti

```html
<div class="layout">
  <aside class="sidebar" id="sidebar">
    <div class="brand">
      <div class="brand-mark"><!-- SVG logo --></div>
      <div class="brand-text">
        <h1>App <em>Name</em></h1>
        <p>Alt başlık</p>
        <span class="tagline">TAG · LINE</span>
      </div>
      <div class="brand-lock-wrap">
        <button type="button" class="sidebar-lock-btn" id="sidebarLockBtn" aria-label="Menü kilidi">🔒</button>
      </div>
    </div>
    <div class="search-box">
      <input type="search" placeholder="Ara…" />
    </div>
    <nav class="nav" id="nav">
      <!-- .nav-section-title, .nav-section-divider, .nav-btn -->
    </nav>
  </aside>

  <div class="overlay" id="overlay" aria-hidden="true"></div>

  <div class="main">
    <header class="topbar">
      <button class="menu-btn" id="menuBtn" type="button" aria-label="Menü">☰</button>
      <div class="topbar-title">
        <h2 id="pageTitle">Sayfa</h2>
      </div>
      <div class="topbar-actions">
        <button type="button" class="icon-btn" id="themeBtn" title="Tema" aria-label="Tema">◐</button>
      </div>
    </header>
    <div class="workspace" id="workspace">
      <div class="panel visible" id="panel-example">
        <!-- içerik -->
      </div>
    </div>
  </div>
</div>
```

### Body class’ları (sidebar state)

| Class | Etki |
|-------|------|
| `sidebar-collapsed` | Sidebar 76px, label’lar gizli |
| `sidebar-locked` | Hover ile genişleme kapalı |
| `mobile-menu-open` | Mobil menü açık, body scroll kilit |
| `sidebar.open` (aside üzerinde) | Mobilde drawer görünür |

---

## 8. Bileşen kataloğu

### 8.1 Sidebar & navigasyon

**`.nav-btn`** — sol menü öğesi

- Default: `color: var(--muted)`, transparent bg
- Hover: `background: var(--primary-light)`
- Active: `background: var(--secondary)`, `color: #fff`, purple glow shadow

```css
.nav-btn.active {
  background: var(--secondary);
  color: #fff;
  font-weight: 600;
  box-shadow: 0px 0px 0px 1px var(--secondary), 0px 0px 4px 8px rgba(118, 69, 217, 0.35);
}
```

**`.nav-avatar`** — menü ikon kutusu (`data-accent="0"` … `"7"` ile 8 renk varyantı)

**`.nav-section-divider`** — gradient çizgi + dönük cyan kare (gem)

**`.sidebar-lock-btn`** — 34×34, border `1.5px`; `.locked` → secondary renk

### 8.2 Topbar

- **`.topbar`** — `padding: 14px 24px`, `background: var(--bg2)`, alt border, pattern overlay (`opacity: 0.34`)
- **`.icon-btn`** — 44×44, border, hover → primary
- **`.menu-btn`** — mobilde görünür (`display: none` desktop)

### 8.3 Kart

```html
<div class="card">
  <div class="card-header">BAŞLIK</div>
  <div class="card-body">
    <!-- içerik -->
  </div>
</div>
```

```css
.card {
  background: var(--surface);
  border: 1px solid var(--border);
  border-radius: var(--radius-card);
  box-shadow: var(--shadow);
  overflow: visible;
  position: relative;
}
.card::before {
  content: "";
  position: absolute;
  inset: 0;
  border-radius: inherit;
  pointer-events: none;
  opacity: 0.36;
  background-image: var(--pattern-tile);
  background-size: var(--pattern-tile-size);
  z-index: 0;
}
.card-header, .card-body { position: relative; z-index: 1; }
.card-header {
  padding: 14px 18px;
  border-bottom: 1px solid var(--border);
  font-family: var(--font-display);
  font-weight: 700;
  font-size: 0.9rem;
}
.card-body { padding: 18px; }
```

### 8.4 Form alanı

```html
<div class="field">
  <div class="field-label-row">
    <label>Alan adı</label>
  </div>
  <input type="text" />
</div>
```

```css
.field label {
  font-size: 0.68rem;
  font-weight: 700;
  color: var(--muted);
  text-transform: uppercase;
  letter-spacing: 0.05em;
}
.field input, .field select, .field textarea {
  width: 100%;
  padding: 9px 11px;
  border: 1.5px solid var(--border);
  border-radius: 9px;
  background: var(--bg);
  color: var(--text);
  font-family: inherit;
  font-size: 0.875rem;
  outline: none;
  transition: border-color 0.18s ease, box-shadow 0.18s ease;
}
.field input:focus, .field select:focus, .field textarea:focus {
  border-color: var(--primary);
  box-shadow: 0 0 0 3px var(--glow);
}
```

Select ok ikonu: custom SVG chevron, `appearance: none`, `padding-right: 34px`.

### 8.5 Butonlar

| Class | Görünüm |
|-------|---------|
| `.btn` | base: `padding: 11px 20px`, `border-radius: 10px`, `font-weight: 700` |
| `.btn-send` | cyan gradient + glow shadow; hover `translateY(-2px)` |
| `.btn-ghost` | `background: var(--bg)`, border `1.5px solid var(--border)` |
| `.btn-sm` | `padding: 7px 12px`, `font-size: 0.78rem` |
| `.btn.is-loading` | spinner, `pointer-events: none` |

```html
<div class="btn-row">
  <button type="button" class="btn btn-send">Kaydet</button>
  <button type="button" class="btn btn-ghost">İptal</button>
</div>
```

```css
.btn-send {
  background: var(--gradient-btn);
  color: #fff;
  box-shadow: 0px 0px 0px 1px var(--primary-dark), 0px 0px 4px 8px rgba(31, 199, 212, 0.35);
}
.btn-send:hover:not(:disabled) {
  transform: translateY(-2px);
  background: var(--gradient-btn-hover);
}
.btn-ghost {
  background: var(--bg);
  border: 1.5px solid var(--border);
  color: var(--text);
}
.btn-ghost:hover { border-color: var(--primary); color: var(--primary); }
```

### 8.6 Boolean toggle (ON/OFF segment)

**Stil A — `.bool-btns` + `.bool-btn`** (`api-tester`)

```html
<div class="bool-btns" data-field="enabled">
  <button type="button" class="bool-btn" data-val="0">Hayır</button>
  <button type="button" class="bool-btn on" data-val="1">Evet</button>
</div>
```

Active: `background: var(--primary)`, white text, `box-shadow: 0 2px 10px var(--glow)`.

**Stil B — `.flag-toggle-group` + `.flag-toggle-seg`** (`bot-console`, tablo içi)

```html
<div class="flag-toggle-group">
  <button type="button" class="flag-toggle-seg off active" data-val="0">OFF</button>
  <button type="button" class="flag-toggle-seg on" data-val="1">ON</button>
</div>
```

OFF active → warning tonu; ON active → success tonu; `border-radius: 999px`.

### 8.7 Switch toggle

**`.toggle`** + **`.toggle.on`** — 52×28 pill, cyan when on, animasyonlu knob (`cubic-bezier(0.34, 1.4, 0.64, 1)`).

### 8.8 Custom select

```html
<div class="custom-select">
  <button type="button" class="custom-select-trigger">
    <span>Seçenek</span>
    <span class="custom-select-chevron"></span>
  </button>
  <ul class="custom-select-menu">
    <li><button type="button" class="custom-select-option selected">A</button></li>
  </ul>
</div>
```

`.custom-select.open` → menu açık, trigger alt köşeler düz, cyan border + glow.

### 8.9 Tab switcher

**`.view-tabs`** container, **`.view-tab`** / **`.view-tab.active`** (active → primary bg, white text).

### 8.10 Tablo

**Data table** (`bot-console`):

- Wrapper: `.data-table-wrap` (scroll, pattern overlay)
- Count bar: `.data-table-count`
- Table: `.data-table` — sticky header, `font-size: 0.84rem`
- Badge: `.cell-badge`, `.cell-badge.side-long`, `.status-1`, vb.

**Screener table** (`api-tester`):

- `.screener-table-wrap` → `.screener-table`
- Sortable header: `.screener-sort-th.active` → secondary underline
- Pagination: `.screener-pagination-bar`, `.screener-pagination-left`, `.screener-pagination-right`

### 8.11 Modal / overlay

```css
.overlay {
  display: none;
  position: fixed;
  inset: 0;
  background: rgba(8, 6, 11, 0.45);
  z-index: 210;
}
.overlay.show { display: block; pointer-events: auto; }

.trade-detail-modal {
  display: none;
  position: fixed;
  inset: 0;
  z-index: 230;
  background: rgba(8, 12, 20, 0.72);
  backdrop-filter: blur(6px);
  padding: 20px;
  align-items: center;
  justify-content: center;
}
.trade-detail-modal.open { display: flex; }
```

Modal inner: `width: min(96vw, 920px)`, `border-radius: var(--radius)`, sticky header.

### 8.12 JSON / code view

```css
.json-view {
  padding: 16px;
  border-radius: 10px;
  background: var(--code-bg);
  color: var(--code-text);
  font-size: 0.78rem;
  line-height: 1.65;
  overflow: auto;
}
```

Syntax: `.json-key` `#79c0ff`, `.json-str` `#a5d6ff`, `.json-num` `#ffa657`, `.json-bool` `#ff7b72`, `.json-null` `#8b949e`

### 8.13 Status & flash

- `.status-badge.ok` / `.err` / `.idle`
- `.flash.ok` / `.flash.err` — üst bildirim şeridi
- `.usd-profit` → `--success`, `.usd-loss` → `--error`

### 8.14 Spinner

```html
<span class="ui-spinner ui-spinner-inline" role="status" aria-label="Yükleniyor"></span>
```

```css
@keyframes ui-spin { to { transform: rotate(360deg); } }
.ui-spinner {
  display: inline-block;
  width: 18px;
  height: 18px;
  border: 2.5px solid rgba(118, 69, 217, 0.22);
  border-top-color: var(--primary);
  border-radius: 50%;
  animation: ui-spin 0.65s linear infinite;
}
```

### 8.15 Collapsible card

`.collapsible-card` + `.is-collapsed` → body gizli, chevron `-90deg` rotate.

### 8.16 Panel geçişi

```css
.panel { display: none; }
.panel.visible { display: block; animation: fadeUp 0.3s ease; }
@keyframes fadeUp {
  from { opacity: 0; transform: translateY(8px); }
  to { opacity: 1; transform: translateY(0); }
}
```

---

## 9. Scrollbar

```css
* {
  scrollbar-width: thin;
  scrollbar-color: rgba(118, 69, 217, 0.45) transparent;
}
*::-webkit-scrollbar { width: 6px; height: 6px; }
*::-webkit-scrollbar-track { background: transparent; }
*::-webkit-scrollbar-thumb {
  background: rgba(122, 110, 170, 0.35);
  border-radius: 999px;
}
*::-webkit-scrollbar-thumb:hover {
  background: rgba(31, 199, 212, 0.55);
}
[data-theme="dark"] * {
  scrollbar-color: rgba(154, 106, 255, 0.45) transparent;
}
```

---

## 10. Animasyon & geçişler

| Öğe | Süre | Easing |
|-----|------|--------|
| Sidebar width | `0.28s` | `ease` |
| Button hover | `0.15–0.18s` | `ease` |
| Nav / icon hover | `0.18s` | `ease` |
| Toggle knob | `0.22s` | `cubic-bezier(0.34, 1.4, 0.64, 1)` |
| Panel fadeUp | `0.3s` | `ease` |
| btn-send hover | `transform: translateY(-2px)` | |

**Hover kuralı:** sadece renk değil; butonlarda transform/shadow da kullan.

---

## 11. Responsive breakpoints

| Breakpoint | Davranış |
|------------|----------|
| `min-width: 961px` | Sidebar shadow; collapsed mode; menu-btn gizli |
| `max-width: 960px` | Sidebar `position: fixed`, `translateX(-100%)`; `.sidebar.open` → görünür; overlay; menu-btn görünür |
| `max-width: 900px` | İki kolon layout → tek kolon |
| `max-width: 720px` | Topbar CSS grid 2 satır; url-field tam genişlik; btn-row dikey; min touch `44px` |

### Mobil topbar grid (≤720px)

```
[ menu ] [ title        ] [ actions ]
[ url field — full width            ]
```

### Mobil sidebar JS

```js
function setMobileMenu(open) {
  var sidebar = document.getElementById("sidebar");
  var overlay = document.getElementById("overlay");
  if (open) {
    sidebar.classList.add("open");
    overlay.classList.add("show");
    document.body.classList.add("mobile-menu-open");
  } else {
    sidebar.classList.remove("open");
    overlay.classList.remove("show");
    document.body.classList.remove("mobile-menu-open");
  }
}
```

### Mobil sidebar CSS (≤960px)

```css
@media (max-width: 960px) {
  .sidebar {
    position: fixed;
    left: 0; top: 0; bottom: 0;
    width: min(88vw, var(--sidebar-w));
    transform: translateX(-100%);
    transition: transform 0.28s ease;
    z-index: 220;
    box-shadow: 8px 0 32px rgba(8, 6, 11, 0.18);
  }
  .sidebar.open { transform: translateX(0); }
  .menu-btn { display: inline-flex; }
}
```

---

## 12. Tema toggle JS

```js
document.getElementById("themeBtn").addEventListener("click", function () {
  var html = document.documentElement;
  var next = html.getAttribute("data-theme") === "dark" ? "light" : "dark";
  html.setAttribute("data-theme", next);
  localStorage.setItem("app-theme", next);
});
```

---

## 13. Logo / favicon

Gradient daire: `#FFB237` → `#7645D9` (warning → secondary).

```css
.brand-mark {
  width: 44px;
  height: 44px;
  border-radius: 50%;
  box-shadow: 0 4px 14px rgba(255, 178, 55, 0.35);
}
```

---

## 14. Renk kullanım rehberi (semantic)

| Durum | Renk |
|-------|------|
| Primary action | `--primary` / `.btn-send` |
| Active nav | `--secondary` bg |
| Focus ring | `--glow` (3px box-shadow) |
| Long / profit | `--success` |
| Short / loss | `--error` |
| Warning / OFF | `--warning` |
| Disabled | `opacity: 0.55` |
| Read-only input | `opacity: 0.75`, hafif purple tint bg |

`color-mix(in srgb, ...)` modern tarayıcılarda grup border ve filter arka planları için kullanılıyor.

---

## 15. Yeni projeye uygulama checklist

1. [ ] CSS variables (light + dark) ekle
2. [ ] Kanit font + FOUC script
3. [ ] `body::before` / `body::after` pattern katmanları
4. [ ] `.layout` shell (sidebar + main + overlay)
5. [ ] Nav, topbar, card, field, btn bileşenleri
6. [ ] Scrollbar stilleri
7. [ ] `fadeUp` panel animasyonu
8. [ ] Tema toggle + localStorage
9. [ ] Mobil: `@media (max-width: 960px)` sidebar drawer
10. [ ] Touch: buton min-height `44px` mobilde
11. [ ] Tablo/badge/toggle ihtiyaca göre ekle

---

## 16. Dosya organizasyonu önerisi

```
styles/
  theme-tokens.css      /* :root + [data-theme="dark"] */
  theme-base.css        /* reset, body layers, scrollbar */
  theme-layout.css      /* layout, sidebar, topbar, workspace */
  theme-components.css  /* card, btn, field, table, modal */
  theme-responsive.css  /* media queries */
```

Kaynak projede tüm stiller `examples/api-tester.html` ve `examples/bot-console.html` içinde inline `<style>` olarak duruyor.

---

## 17. Referans kaynak satırları

| Dosya | İçerik |
|-------|--------|
| `examples/api-tester.html` ~18–160 | Tokens, body, scrollbar |
| `examples/api-tester.html` ~162–508 | Sidebar, nav, topbar |
| `examples/api-tester.html` ~1393–1820 | Card, fields, buttons |
| `examples/api-tester.html` ~4861–5033 | Responsive |
| `examples/api-tester.html` ~6117–6192 | HTML shell |
| `examples/bot-console.html` ~245–320 | Data table, flag toggle, badges |

---

## 18. Agent prompt örneği

Başka workspace’e bu dosyayı kopyaladıktan sonra:

> `docs/PANCAKE-DASHBOARD-THEME.md` dosyasındaki tasarım sistemini uygula. Tüm renkler CSS custom properties ile gelsin. Light/dark tema, sidebar+topbar app shell, Kanit font, card/field/btn bileşenleri ve 960px/720px responsive kuralları birebir uyulsun. Mevcut içeriği bu shell içine taşı; renk ve spacing hard-code etme.
