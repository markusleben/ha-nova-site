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

The product itself: HA NOVA connects AI coding clients to Home Assistant. A lean **NOVA Relay** runs as an App on the HA server and is the only component talking to Home Assistant; all knowledge lives in readable **Markdown skills** on the user's machine ("Relay stays dumb, skills stay smart"). Onboarding: one installer command, one wizard, one six-digit one-time code. Optional (Beta): away-from-home access via the user's own Home Assistant Cloud/Nabu Casa account — local always preferred, cloud is automatic fallback, OAuth credentials in the OS-native credential store, no HA NOVA-operated tunnel/broker.

## Positioning

Safety is the core promise, not magic: every change is previewed, confirmed, and verified; deletes need a specific confirmation code; `revert` undoes the latest verified update where supported. Every rule the AI follows is a readable markdown file. No HA NOVA-operated cloud relay, no usage analytics. Origin story (optional, footer-adjacent): an 88,000-line MCP server became a lean relay + readable markdown skills; early demo `https://youtu.be/ylak867RkzM`.

## Operating Context

- The site is and stays a **one-pager** — documentation remains in the product repo on GitHub.
- Collaboration mode is binding (recorded in CLAUDE.md): build a full local draft, show desktop **and** mobile screenshots plus design decisions, iterate on feedback; **no push, no Pages activation without Markus's explicit go.**
- Quality self-check before every showing: screenshots both widths, every link clicked, both copy buttons tested, claims check, OG meta verified.

## Capabilities and Constraints

**Source of truth (standing rule, from Markus 2026-08-02): the product repo `markusleben/ha-nova` — its README and docs — is always the truth. Every time this page is filled or updated with content, the repo must be checked first; PROMPT.md's copy blocks are a snapshot and can lag behind.** Verified repo facts as of 2026-08-02: the six-digit code comes from the NOVA page in the Home Assistant sidebar (not the wizard), is one-time and expires in minutes; tokenless pairing applies to App installs only — Container/Core use a token-based standalone-container setup; the safety workflow has 7 steps (adds "Offers a safe test" and "Offers a way back", with the honesty clause that HA NOVA announces when no automatic revert exists); revoke is one click from NOVA on App installs; an optional installation census exists, off by default, strictly opt-in; Cloud (Beta) requires HA OS/Supervised, a Nabu Casa subscription with Remote UI, and a desktop session; the client is named "Hermes Agent" (preview); the README carries an "actively developed — back up your configs" notice.

Hard content rules (non-negotiable, from the original brief, still binding):

- Only the claims/copy blocks listed in PROMPT.md — nothing invented: no testimonials, user counts, benchmarks, or feature promises.
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
2. **Truth is enumerated** — every claim on the page traces to a copy block in PROMPT.md; absence of evidence is stated, never filled.
3. **Self-contained and lean** — no external dependencies mirrors the product's own no-tunnel/no-analytics stance.
4. **Accessible to non-terminal users** — copy and structure must work for HA users who have never opened a shell.

## Accessibility & Inclusion

WCAG AA contrast on the dark theme (brief requirement). Meaningful `alt` text on all images; `loading="lazy"` except hero.
