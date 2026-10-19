# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Stack

Static HTML/CSS (per the original build brief, now deleted — see git history for PROMPT.md): one `index.html` + one `styles.css` in the repo root, no framework, no build step, no CDNs/webfonts/trackers. Only JavaScript: a few lines of vanilla JS for copy buttons. Deploy target: GitHub Pages ("Deploy from branch", `main`, `/root`) with custom domain `https://hanova.app/` (registered 2026-08; CNAME file in repo root, canonical/OG URLs point there; `markusleben.github.io/ha-nova-site` remains the fallback).

## Users

Home Assistant users, explicitly including people without terminal experience, evaluating whether to connect their AI coding assistant (Claude Code, Claude Desktop, Codex CLI, OpenCode, Google Antigravity, Hermes preview) to their Home Assistant instance. Visitors arrive via the GitHub repo/README, the HA community (forum, Reddit, Discord), directly shared links (social preview matters), and search.

## Product Purpose

This repo is the landing page for **HA NOVA** (product truth lives at `markusleben/ha-nova`). The page must: (1) make clear in 5 seconds what HA NOVA is, (2) build trust — the safety workflow is the centerpiece, (3) move visitors to try it via prominent, copyable install commands, (4) be shareable with clean OG/Twitter meta.

The product itself: HA NOVA connects AI coding clients to Home Assistant. A lean **NOVA Relay** runs as an App on the HA server and is the only component talking to Home Assistant; all knowledge lives in readable **Markdown skills** on the user's machine ("Relay stays dumb, skills stay smart"). Onboarding: one installer command, one wizard, a one-time sign-in with Home Assistant (a six-digit one-time code as the fallback). Optional (Beta): away-from-home access via the user's own Home Assistant Link (formerly Home Assistant Cloud)/Nabu Casa account — local always preferred, cloud is automatic fallback, OAuth credentials in the OS-native credential store, no HA NOVA-operated tunnel/broker.

## Positioning

Safety is the core promise, not magic: every change is previewed, confirmed, and verified, except unambiguous everyday actions, which run right away and are verified afterwards; locks, gates, the alarm, restarting Home Assistant, and deletes need explicit confirmation (a window on the computer, the linked phone, or a one-time code typed by the user); `revert` undoes the latest verified update where supported. Every rule the AI follows is a readable markdown file. No HA NOVA-operated cloud relay, no usage analytics. Origin story (an 88,000-line MCP server became a lean relay + readable markdown skills; early demo `https://youtu.be/ylak867RkzM`): removed from the page by Markus's decision (2026-08-02) — no visitor value, ages badly as a number comparison. Do not re-add without asking.

## Operating Context

- The site is and stays a **one-pager** — documentation remains in the product repo on GitHub.
- One exception: `demo/` is the start page of the hosted demo (`demo.hanova.app` redirects `/` and `/start` here). It shares `styles.css` and `assets/`, is linked from `index.html` (hero note, Get started note, footer) and indexable since the release sync of 2026-10-17; before that it was unlinked and `noindex`. It shows the demo's live Home Assistant version, fetched at runtime from `https://demo.hanova.app/connect.json` (hidden when that fails) — not an HA NOVA version number. Its shared-account warning stays on the page.
- Collaboration mode is binding (recorded in CLAUDE.md): build a full local draft, show desktop **and** mobile screenshots plus design decisions, iterate on feedback; **no push, no Pages activation without Markus's explicit go.**
- Quality self-check before every showing: screenshots both widths, every link clicked, both copy buttons tested, claims check, OG meta verified.

## Capabilities and Constraints

**Source of truth (standing rule, from Markus 2026-08-02): the product repo `markusleben/ha-nova` — its README and docs — is always the truth. Every time this page is filled or updated with content, the repo must be checked first; PROMPT.md's copy blocks are a snapshot and can lag behind.** Verified repo facts as of 2026-08-06 (release v0.23.0); re-verified 2026-10-15 against the README of release v0.25.1 (v0.25.0/v0.25.1 changed the Cloud setup wording: a desktop session for the one-time authorization, SSH resume for an interrupted verified setup; Container, Core, WSL, and headless stay local-only). Facts: the six-digit code comes from the NOVA page in the Home Assistant sidebar (not the wizard), is one-time and expires in minutes; tokenless pairing applies to App installs only — Container/Core use a token-based standalone-container setup; the safety workflow has 8 steps (v0.23.0 added "Captures a recovery point first" and expanded "Offers a way back" to three layers: revert, config-snapshot restore of deleted items, HA Backup — covering only changes made through HA NOVA); revoke is one click from NOVA on App installs (v0.23.0: revoke shows the exact device first); an optional installation census exists, off by default, strictly opt-in (superseded: removed in v0.26.0, see below); Cloud (Beta) requires HA OS/Supervised, a Nabu Casa subscription with Remote UI, and a desktop session for the one-time authorization; the client is named "Hermes Agent" (preview); multi-server profiles exist (`--server <name>`); the README's "Why not an MCP server?" section now carries a comparison table and an honest "the MCP side is ahead on breadth today" note (page keeps the compact version); install commands in the README Get Started remain the unpinned main-branch ones the page uses. Synced 2026-10-17 against the pre-release README of the v0.26.0 release-prep PR markusleben/ha-nova#723 (README at 151c4abf; final verification after the stable tag; then `.readme-sync`): pairing defaults to "Sign in with Home Assistant" as the owner (the six-digit code is the fallback over SSH, without a browser, or as another HA user; the NOVA page is owner-only, so the owner clicks "Connect a device" and the user types the code); once a phone is linked, an action it cannot reach is refused, never moved to chat; the three steps are installer (opens the NOVA Relay App page: "Add", then Install and Start; skipped when the App already runs; superseded 2026-10-19, see below), sign-in, first look; confirmations go to a Confirm window on the computer, else the one linked phone (Companion app), else a four-digit one-time code in chat that the AI can see too; automation, script, and dashboard deletes use the window or phone, other deletes (helpers, scenes, areas, and the like) take the four-digit chat code; the window button is Confirm (OK on Windows); anything allowed to control the screen can click the window (`ha-nova setup confirm-window off`); restarting Home Assistant joined the confirmation list; the Nabu Casa product is "Home Assistant Link (formerly Home Assistant Cloud)", with remote access enabled, still Beta; dashboards get a copy before each save and undo, "undo that" works right after a delete; new "You say" rows (dashboards, home map, device replacement, Node-RED migration, ESPHome); 34 task skills plus the context skill (not shown on the page); the demo house (`/demo/`) is linked from the README as a place to look around before connecting your own — not for trying HA NOVA (the CLI demo connection is not implemented); the installation census is gone ("no installation counting"). Re-verified 2026-10-19 against the released v0.26.0 README (tag 6632a551; README sha256 3098f040ab9e24551dd956b74b46e9115b0cae335f07e414280a5ece747cbcd5, recorded in `.readme-sync` by the readme-sync check): sign-in as the owner now installs and starts the NOVA Relay App when needed (step 1 only finds Home Assistant); without a browser or as another HA user the wizard shows the App page ("Add", then Install and Start) and the code pairs; over SSH pairing is reliable on Linux only (Windows/macOS: run setup on the local desktop); the linked phone asks without a desktop (e.g. headless Linux), answerable on the locked phone or Apple Watch while a request is open (up to 90 seconds), linking/moving/turning off needs the unlocked phone; where-used also lists helpers and dashboard cards and says what it could not check.

Hard content rules (non-negotiable, from the original brief, still binding):

- Only claims backed by the product repo README/docs — nothing invented: no testimonials, user counts, benchmarks, or feature promises.
- No version numbers anywhere. Cloud access always labeled **Beta**.
- Terminology: **"App"**, never "Add-on". Product name **HA NOVA**, server part **NOVA Relay**.
- Install commands verbatim:
  - macOS/Linux: `curl -fsSL https://raw.githubusercontent.com/markusleben/ha-nova/main/install.sh | bash`
  - Windows (PowerShell): `irm https://raw.githubusercontent.com/markusleben/ha-nova/main/install.ps1 | iex`
- No private URLs, no real entity/instance data, no screenshots of third-party UIs.
- Page language: **English**.
- Responsive, never horizontal page scroll; code blocks scroll internally.
- Copy (tagline, you-say examples, safety workflow, ground rules, cloud paragraph, prerequisites, links) follows the product repo's README verbatim or closely paraphrased; the repo is the source of truth (see rule above).

## Brand Commitments

Binding visual constraints from the original brief (recorded, not expanded; the built system is documented in DESIGN.md):

- Dark cosmos theme: background gradient `#0A0E1A → #0D1525 → #0A1628`; headline `#E8EDF2`; secondary `#B8CCE0`; accents **cyan `#18BCF2`** (= local/client) and **amber `#FFB347`** (= server/safe) — semantics must not be swapped. Sparse small white star dots (opacity ~0.3) allowed.
- Typography: system sans, generous whitespace, no webfonts.
- **The star is sacred**: only `assets/logo.svg` / `assets/icon.svg` — never redrawn, distorted, glowed/shadowed, or rebuilt in CSS.
- Brand tone: honest, precise, anti-hype.

## Evidence on Hand

Vendored brand assets in `assets/` (from released product state): `logo.svg`, `logo-dark-text.svg`, `icon.svg` (favicon source + hero star + in-scene star), `social-preview.png` (OG image, absolute URL), plus rendered bitmaps of the original icon (`apple-touch-icon.png`, `favicon-64.png`). The PNG diagrams (`hero-banner.png`, `pairing-flow.png`, `cloud-fallback.png`, `how-it-works-v3.png`, `skills-vs-tools.png`) are no longer used on the page (replaced by authored inline-SVG scenes since revision 2) but stay vendored as brand reference. No testimonials, user counts, or benchmarks exist — future work must not fabricate them.

## Product Principles

1. **Trust before conversion** — the safety workflow is the page's centerpiece; honesty (Beta labels, prerequisites) outranks polish.
2. **Truth is enumerated** — every claim on the page traces to the product repo README/docs; absence of evidence is stated, never filled.
3. **Self-contained and lean** — no external dependencies mirrors the product's own no-tunnel/no-analytics stance.
4. **Accessible to non-terminal users** — copy and structure must work for HA users who have never opened a shell.

## Accessibility & Inclusion

WCAG AA contrast on the dark theme (brief requirement). Meaningful `alt` text on all images; `loading="lazy"` except hero.
