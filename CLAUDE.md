# CLAUDE.md — ha-nova-site

Statische Landingpage (One-Pager) für **HA NOVA**. Live-Ziel: GitHub Pages mit Custom Domain **https://hanova.app/**. Seitensprache: Englisch. Kommunikation mit Markus: Deutsch.

## Quelle der Wahrheit (wichtigste Regel)

**Das Produkt-Repo `markusleben/ha-nova` (README + docs) ist IMMER die Wahrheit.** Vor jedem Befüllen oder Ändern von Seiteninhalten den aktuellen Stand prüfen:

```sh
gh api repos/markusleben/ha-nova/readme -H "Accept: application/vnd.github.raw"
```

Das Repo gewinnt jeden Konflikt. Verifizierte Fakten mit Datum in PRODUCT.md nachführen.

## Lebende Dokumente

- **PRODUCT.md** — Produktwahrheit, Zielgruppe, harte Inhaltsregeln, Arbeitsmodus. Vor jeder Arbeit lesen.
- **DESIGN.md** + `.impeccable/design.json` — das visuelle System („The Legible Cosmos"). Design-Arbeit läuft über die `/impeccable`-Kommandos; der Design-Hook prüft automatisch.
- Die frühere **PROMPT.md** (initialer Bau-Brief) ist gelöscht — sie war ein Snapshot und veraltete; die Git-Historie bewahrt sie.

## Harte Inhaltsregeln (Kurzfassung, Details in PRODUCT.md)

- Nur belegte Claims aus dem Produkt-Repo. Nichts erfinden: keine Testimonials, Nutzerzahlen, Benchmarks.
- Keine Versionsnummern auf der Seite. Cloud-Zugriff immer als **Beta** kennzeichnen.
- Terminologie: **„App"**, niemals „Add-on". Produktname **HA NOVA**, Serverteil **NOVA Relay**.
- Install-Befehle wörtlich und unverändert übernehmen.
- **Der Stern ist heilig:** nur `assets/logo.svg` / `assets/icon.svg` — nie nachzeichnen, verzerren, mit Glow/Schatten versehen oder in CSS nachbauen. (Die gerenderten `apple-touch-icon.png`/`favicon-64.png` sind Format-Konvertierungen des Originals.)

## Technik-Leitplanken

- Eine `index.html` + eine `styles.css`, Vanilla-JS minimal (Copy-Buttons, IntersectionObserver-Reveals). Kein Framework, kein Build-Schritt, keine CDNs/Webfonts/Tracker.
- Responsive, nie horizontales Seitenscrollen; Code-Blöcke scrollen intern. WCAG AA auf dunklem Grund.
- Bildsprache: handgebaute Inline-SVG-Neon-Szenen (Cyan = lokal/Client, Amber = Server/sicher — nie vertauschen). Motion sparsam, `prefers-reduced-motion` respektieren, ohne JS bleibt alles sichtbar.
- OG/Canonical-URLs zeigen auf `https://hanova.app/`; `CNAME`-Datei liegt im Root.

## Arbeitsmodus mit Markus

1. Änderungen lokal bauen, mit Desktop- **und** Mobile-Screenshots zeigen (Chrome headless oder Playwright-Skripte im Scratchpad).
2. Feedback-Runden, bei Geschmacksfragen lieber 2 Varianten zeigen.
3. **Kein Commit, Push oder Deploy ohne ausdrückliches Go.**
4. Inhalts-Sync auf Zuruf („sync mit dem README") → Seite gegen aktuelles Produkt-README diffen, Änderungen vor Einbau zeigen.
