# Bau-Prompt: HA NOVA Landingpage

Baue in diesem Repository (`ha-nova-site`) eine statische Landingpage für **HA NOVA**; Ziel-Hosting ist GitHub Pages. Arbeite ausschließlich in diesem Repo — das Produkt-Repository `markusleben/ha-nova` wird weder benötigt noch verändert.

## Arbeitsmodus: gemeinsam, nicht autonom (WICHTIG)

Die Seite entsteht **im Zusammenspiel mit Markus** — nicht in einem Rutsch bis zum Deploy:

1. **Erster Entwurf**: eine vollständige, lokal lauffähige Version bauen (alle Sektionen, echte Assets), aber **nichts pushen und Pages nicht aktivieren**.
2. **Zeigen**: den Entwurf Markus präsentieren — Screenshots in Desktop- **und** Mobilbreite (bzw. die Seite im Browser öffnen) plus 3–5 Sätze zu getroffenen Gestaltungsentscheidungen und offenen Fragen (z. B. Bildauswahl, Sektionslänge, CTA-Wortlaut).
3. **Feedback-Runden**: seine Änderungswünsche umsetzen, erneut zeigen — so oft wie nötig. Bei Geschmacksfragen (Layout-Varianten, Farbgewichtung) lieber 2 Varianten zeigen als raten.
4. **Erst nach seiner ausdrücklichen Freigabe**: committen, pushen, GitHub Pages aktivieren, Live-URL verifizieren.

Ohne explizites „Go" von Markus wird weder gepusht noch deployed.

## Was HA NOVA ist (dein vollständiger Faktenstand)

HA NOVA verbindet AI-Coding-Clients (Claude Code, Claude Desktop, Codex CLI, OpenCode, Google Antigravity, Hermes preview) mit Home Assistant. Architektur: Ein schlanker **NOVA Relay** läuft als App auf dem Home-Assistant-Server und ist die einzige Komponente, die mit Home Assistant spricht; das gesamte Wissen liegt in lesbaren **Markdown-Skills** auf dem Rechner des Users („Relay stays dumb, skills stay smart"). Onboarding: ein Installer-Befehl, ein Wizard, ein sechsstelliger Einmal-Code. Optional (Beta): Zugriff von unterwegs über den eigenen Home Assistant Cloud-/Nabu-Casa-Account — lokal bleibt immer bevorzugt, Cloud ist automatischer Fallback, OAuth-Zugangsdaten liegen im nativen Credential-Store des Betriebssystems, HA NOVA betreibt keinen eigenen Tunnel/Broker. Zielgruppe: Home-Assistant-Nutzer, auch ohne Terminal-Erfahrung. Markenton: ehrlich, präzise, anti-hype — Sicherheit ist das Kernversprechen, nicht Magie.

## Ziel der Seite

1. In 5 Sekunden verstehen, was es ist (Hero).
2. Vertrauen aufbauen (Safety-Workflow als Herzstück).
3. Zum Ausprobieren bewegen (Install-Befehl prominent, kopierbar).
4. Teilbar sein (saubere OG-/Twitter-Meta mit `assets/social-preview.png`).

## Harte Inhaltsregeln (nicht verhandelbar)

- Nur die unten aufgeführten Claims/Formulierungen verwenden — **nichts dazuerfinden**: keine Testimonials, keine Nutzerzahlen, keine Benchmarks, keine Feature-Versprechen.
- **Keine Versionsnummern** irgendwo auf der Seite. Cloud-Zugriff immer als **Beta** kennzeichnen.
- Terminologie: **„App"**, niemals „Add-on". Produktname: **HA NOVA**, Serverteil: **NOVA Relay**.
- Install-Befehle exakt so, unverändert:
  - macOS/Linux: `curl -fsSL https://raw.githubusercontent.com/markusleben/ha-nova/main/install.sh | bash`
  - Windows (PowerShell): `irm https://raw.githubusercontent.com/markusleben/ha-nova/main/install.ps1 | iex`
- Keine privaten URLs, keine echten Entity-/Instanzdaten, keine Screenshots fremder UIs.
- Das Produkt nie über die Abwesenheit von Tokens/Alt-Flows definieren (kein „no tokens to paste/copy"): Pairing positiv beschreiben — Einmal-Code, eigene Verbindung pro Gerät, jederzeit widerrufbar. Technische Token-Fakten (Standalone-Container) sind davon ausgenommen.
- Sprache der Seite: **Englisch**.

## Verbindliche Copy-Bausteine (wörtlich oder eng paraphrasiert)

- Tagline: **"One code to connect. Every change checked."**
- Hero-Unterzeile (Vorschlag): "HA NOVA connects your AI coding assistant to Home Assistant — with a safety workflow that previews, confirms, and verifies every change."
- „You say → what happens"-Beispiele (wähle 4–5):
  - *"Check my automations for problems"* → Audits against 40+ rules — catches conflicts, dead triggers, and mistakes you'd never spot manually
  - *"Why didn't my motion light trigger last night?"* → Replays the actual trace and shows exactly where it failed and why
  - *"Turn on the porch light at sunset and off at 11 PM"* → Builds, previews, and reviews the automation before it touches your config
  - *"What happened to my living room temperature overnight?"* → Pulls history and summarizes the timeline in plain language
  - *"Add a weather card to my main dashboard"* → Reads the dashboard, shows the change, writes only after you confirm
- Safety-Workflow (kompakt, alle 5 Kernideen): Researches first (no guessing) → Shows the exact change before writing → You approve (deletes need a specific confirmation code) → Writes and verifies → Audits itself. Plus: `revert` undoes the latest verified update where supported.
- Ground-Rules (Auswahl): "Relay credentials stay out of the AI." · "Every device is paired on its own — a one-time six-digit code, revocable anytime." · "Every rule the AI follows is a markdown file you can read." · "No HA NOVA-operated cloud relay or usage analytics."
- Cloud-Sektion: "Works at home and away (Beta): local access stays first; your own Home Assistant Cloud subscription becomes the automatic fallback — no manual URL switching, credentials stay in your OS's native credential store."
- Voraussetzung (ehrlich, klein): "You need Home Assistant — any install type. HA OS and Supervised get the NOVA Relay App via the wizard; Container and Core run the same relay as a standalone container."
- Story-Einzeiler (optional, Footer-nah): aus einem 88.000-Zeilen-MCP-Server wurde ein schlanker Relay + lesbare Markdown-Skills; früher Demo-Link: `https://youtu.be/ylak867RkzM`.
- Links: GitHub `https://github.com/markusleben/ha-nova` · Issues `https://github.com/markusleben/ha-nova/issues` · License MIT.

## Design-System (aus den mitgelieferten Assets — exakt einhalten)

- Dunkles Cosmos-Theme: Hintergrund-Verlauf `#0A0E1A → #0D1525 → #0A1628`; Headline-Text `#E8EDF2`; Sekundärtext `#B8CCE0`; Akzente **cyan `#18BCF2`** (= lokal/Client) und **amber `#FFB347`** (= Server/sicher) — diese Semantik nicht vertauschen. Sparsame kleine weiße Sternpunkte (Opacity ~0.3) sind erlaubt.
- Typografie: System-Sans (`-apple-system, 'Helvetica Neue', 'Segoe UI', sans-serif`), großzügige Weißräume, keine Webfonts.
- **Der Stern ist heilig**: ausschließlich `assets/logo.svg` / `assets/icon.svg` verwenden — niemals nachzeichnen, verzerren, mit Glow/Schatten versehen oder als CSS nachbauen.
- Bilder-Einsatz: `hero-banner.png` (Hero), `pairing-flow.png` (3 Schritte), `cloud-fallback.png` (Cloud-Sektion), `how-it-works-v3.png` (Architektur), optional `skills-vs-tools.png` (Differenzierung „why not a tool server"). Alle mit sinnvollen `alt`-Texten und `loading="lazy"` (außer Hero).
- Favicon aus `assets/icon.svg`; OG-/Twitter-Card-Meta mit absoluter URL auf `assets/social-preview.png`.

## Seitenstruktur (Empfehlung — kürzen erlaubt, Reihenfolge beibehalten)

1. **Hero**: Banner/Star, Tagline, Unterzeile, zwei CTAs („Get started" → Install-Sektion, „View on GitHub").
2. **Three steps, one code**: `pairing-flow.png` + die drei Schritte (Installer → „Connect a device" → sechsstelliger Code).
3. **What you can do**: 4–5 You-say-Beispiele als Karten/Tabelle.
4. **Safe by design**: der 5-Schritte-Workflow + 3–4 Ground-Rules — das ist die wichtigste Sektion nach dem Hero.
5. **At home and away (Beta)**: `cloud-fallback.png` + Cloud-Absatz.
6. **How it works**: Architekturbild + 2 Sätze (Relay dumb, Skills smart).
7. **Get started**: beide Install-Befehle mit Copy-Button, Voraussetzungs-Satz, unterstützte Clients als schlichte Liste (Claude Code, Claude Desktop, Codex CLI, OpenCode, Google Antigravity, Hermes preview).
8. **Footer**: GitHub, Issues, MIT, Story-Einzeiler + Demo-Link.

## Technische Vorgaben

- **Statisch und self-contained**: eine `index.html` + eine `styles.css` im Repo-Root, kein Framework, kein Build-Schritt, keine CDNs/Webfonts/Tracker/Analytics. Einziges JavaScript: wenige Zeilen Vanilla-JS für die Copy-Buttons (mit sichtbarem „Copied!"-Feedback).
- Responsive (Mobile zuerst prüfen); horizontales Scrollen darf nie auftreten; Code-Blöcke scrollen intern.
- Ein bewusst dunkles Theme (passend zu den Assets); Kontrast nach WCAG AA.
- Deployment: GitHub Pages „Deploy from branch" (`main`, `/root`) — per `gh api` aktivieren oder die zwei nötigen Klicks exakt beschreiben. Erwartete URL: `https://markusleben.github.io/ha-nova-site/`.

## Qualitäts-Selbstcheck (vor JEDEM Zeigen an Markus)

1. Seite lokal öffnen und als Screenshot in Desktop- **und** Mobilbreite prüfen (Layout, Kontraste, Bildschärfe).
2. Jeden Link klicken (GitHub, Issues, Demo, Anker); beide Copy-Buttons testen.
3. Claims-Check gegen die Regeln oben: keine Versionsnummer, kein „Add-on", nichts Erfundenes, Cloud überall als Beta.
4. OG-Meta vorhanden und Pfade korrekt; `<title>` + Meta-Description gesetzt.

## Abschluss (erst nach Markus' ausdrücklicher Freigabe)

1. Committen und pushen.
2. GitHub Pages aktivieren („Deploy from branch", `main`, `/root`).
3. Live-URL (`https://markusleben.github.io/ha-nova-site/`) abrufen und final gegenprüfen — inkl. Social-Preview-Test (z. B. OG-Debugger oder Link-Vorschau).
