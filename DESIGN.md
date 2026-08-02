---
name: HA NOVA Landing
description: Cosmos-night one-pager — a safety protocol you can read, drawn in neon lines on a quiet star field.
colors:
  night-top: "#0A0E1A"
  night-mid: "#0D1525"
  night-deep: "#0A1628"
  starlight-ink: "#E8EDF2"
  moonlit-slate: "#B8CCE0"
  nova-cyan: "#18BCF2"
  nova-cyan-bright: "#4FCDF6"
  nova-amber: "#FFB347"
  hairline: "rgba(184, 204, 224, 0.16)"
  scene-neutral: "rgba(184, 204, 224, 0.5)"
  panel-night: "rgba(13, 21, 37, 0.6)"
  abyss-ink: "#05121D"
  star-dot: "rgba(255, 255, 255, 0.3)"
  star-dot-mid: "rgba(255, 255, 255, 0.25)"
  star-dot-faint: "rgba(255, 255, 255, 0.2)"
typography:
  display:
    fontFamily: "-apple-system, 'Helvetica Neue', 'Segoe UI', sans-serif"
    fontSize: "clamp(1.75rem, 0.9rem + 4vw, 3.9rem)"
    fontWeight: 700
    lineHeight: 1.12
    letterSpacing: "-0.02em"
  wordmark:
    fontFamily: "-apple-system, 'Helvetica Neue', 'Segoe UI', sans-serif"
    fontSize: "1rem"
    fontWeight: 600
    letterSpacing: "0.34em"
  headline:
    fontFamily: "-apple-system, 'Helvetica Neue', 'Segoe UI', sans-serif"
    fontSize: "clamp(1.875rem, 1.3rem + 2.4vw, 2.75rem)"
    fontWeight: 700
    lineHeight: 1.2
    letterSpacing: "-0.02em"
  title:
    fontFamily: "-apple-system, 'Helvetica Neue', 'Segoe UI', sans-serif"
    fontSize: "1.25rem"
    fontWeight: 600
    lineHeight: 1.2
  body:
    fontFamily: "-apple-system, 'Helvetica Neue', 'Segoe UI', sans-serif"
    fontSize: "1.0625rem"
    fontWeight: 400
    lineHeight: 1.65
  lead:
    fontFamily: "-apple-system, 'Helvetica Neue', 'Segoe UI', sans-serif"
    fontSize: "1.125rem"
    fontWeight: 400
    lineHeight: 1.65
  quote:
    fontFamily: "-apple-system, 'Helvetica Neue', 'Segoe UI', sans-serif"
    fontSize: "1.1875rem"
    fontWeight: 600
    letterSpacing: "-0.01em"
  label:
    fontFamily: "-apple-system, 'Helvetica Neue', 'Segoe UI', sans-serif"
    fontSize: "0.8125rem"
    fontWeight: 600
    letterSpacing: "0.08em"
  code:
    fontFamily: "ui-monospace, 'SF Mono', Menlo, Consolas, monospace"
    fontSize: "0.9375rem"
  scene-label:
    fontFamily: "-apple-system, 'Helvetica Neue', 'Segoe UI', sans-serif"
    fontSize: "17px"
    fontWeight: 600
  scene-code:
    fontFamily: "ui-monospace, 'SF Mono', Menlo, Consolas, monospace"
    fontSize: "22px"
    fontWeight: 600
    letterSpacing: "0.1em"
  scene-code-sm:
    fontFamily: "ui-monospace, 'SF Mono', Menlo, Consolas, monospace"
    fontSize: "14px"
    fontWeight: 600
    letterSpacing: "0.1em"
  scene-code-sm-condensed:
    fontFamily: "ui-monospace, 'SF Mono', Menlo, Consolas, monospace"
    fontSize: "18px"
    fontWeight: 600
    letterSpacing: "0.1em"
  scene-button:
    fontFamily: "-apple-system, 'Helvetica Neue', 'Segoe UI', sans-serif"
    fontSize: "12px"
    fontWeight: 600
rounded:
  sm: "5px"
  md: "10px"
  scene-tile: "24px"
  pill: "999px"
spacing:
  inline: "1.5rem"
  row: "1.4rem"
  block: "2.5rem"
  grid: "2.5rem"
  section: "clamp(5rem, 13vh, 8.5rem)"
components:
  button-primary:
    backgroundColor: "{colors.nova-cyan}"
    textColor: "{colors.abyss-ink}"
    rounded: "{rounded.pill}"
    padding: "0.85rem 1.9rem"
  button-primary-hover:
    backgroundColor: "{colors.nova-cyan-bright}"
  button-ghost:
    textColor: "{colors.starlight-ink}"
    rounded: "{rounded.pill}"
    padding: "0.85rem 1.9rem"
  chip:
    rounded: "{rounded.pill}"
    padding: "0.35rem 1rem"
  codebar:
    backgroundColor: "{colors.panel-night}"
    textColor: "{colors.starlight-ink}"
    rounded: "{rounded.md}"
    padding: "0.9rem 1.1rem"
  beta-badge:
    textColor: "{colors.nova-amber}"
    rounded: "{rounded.pill}"
    padding: "0.15rem 0.65rem"
---

# Design System: HA NOVA Landing

## Overview

**Creative North Star: "The Legible Cosmos"**

A quiet night sky that you read, not admire. The page is a single dark gradient — near-black blue deepening as you scroll — dotted with a handful of faint, gently breathing stars, and everything on it is set directly on that night: no cards, no panels, no shadows on UI chrome. Content is organized by 1px hairlines, the way a printed protocol is ruled, because the product's promise is a safety protocol you can literally read. The atmosphere is honest, precise, anti-hype; the layout is generous whitespace and typography, never decoration.

Two lights carry all meaning. Cyan (#18BCF2) is your side — local, the client, the action you take. Amber (#FFB347) is the server side — the relay, the safety workflow, the things that guard you. These semantics are fixed and never swapped; a visitor who has scrolled the page once can read every diagram by color alone. All imagery is authored inline-SVG neon scenes: thin round-capped strokes in cyan, amber, and a muted neutral, allowed a subtle glow, drawing themselves in as they scroll into view. The only brand mark is the NOVA star SVG, shipped untouched.

The build is deliberately self-contained — system font stack, no webfonts, no CDNs, no trackers — mirroring the product's own no-tunnel, no-analytics stance. Motion is a narrative grammar, not garnish: a staggered hero rise, scroll-triggered reveals, and semantic line drawing (the local link draws before the cloud fallback because that is the product's priority order). All motion is gated behind a `js` class (no-JS visitors see everything) and fully disabled under reduced motion.

**Key Characteristics:**
- Flat night-gradient world; content sits on the sky, not on cards
- Hairline-ruled rows (1px, rgba(184,204,224,0.16)) as the primary structural device
- Binding two-accent semantics: cyan = local/client, amber = server/safe
- System sans only; hierarchy from weight and color, not typefaces
- Authored inline-SVG neon scenes (2px strokes, round caps, subtle glow) as the only imagery
- Sparse fixed star dots at ~0.2–0.3 white opacity, breathing on a 7s cycle
- Pill-shaped interactive elements; soft radii on surfaces (10px) and scene tiles (24px)
- Motion as narrative: staggered hero rise, scroll reveals, semantic line drawing — all reduced-motion safe and no-JS safe

## Colors

A near-monochrome night-blue field with exactly two accent lights whose meanings are fixed.

### Primary
- **Nova Cyan** (#18BCF2): The local/client light. Primary CTA fill, links, focus outlines, step numerals, the "You say" column, copy buttons, and every scene stroke that represents the visitor's machine or action. Hover brightens to **Bright Cyan** (#4FCDF6). Text set on a cyan fill uses **Abyss Ink** (#05121D) for contrast. In scenes, cyan strokes glow via `drop-shadow(0 0 5px rgba(24,188,242,0.4))`.

### Secondary
- **Nova Amber** (#FFB347): The server/safe light. The safety-workflow timeline (thread, numbered nodes, `code` chips), ground-rule icons, the Beta badge, the "What happens" column, and every scene stroke that represents the relay side and its guarantees (relay tile, checkmark, cloud fallback arc, scene code text). In UI chrome it is mostly stroke/text at 0.15–0.7 alpha; in scenes it glows via `drop-shadow(0 0 5px rgba(255,179,71,0.4))`.

### Neutral
- **Night Top / Mid / Deep** (#0A0E1A → #0D1525 → #0A1628): The page background, a single top-to-bottom `linear-gradient(180deg, …)` with the mid stop at 45%. There is no separate "surface" color; sections live directly on this gradient.
- **Starlight Ink** (#E8EDF2): Headings, the display tagline, emphasized copy, quotes, scene labels, code in code bars — anything that must lead.
- **Moonlit Slate** (#B8CCE0): Default body text, secondary copy, and the tracked hero wordmark.
- **Hairline** (rgba(184,204,224,0.16)): Every rule, border, and divider in UI chrome. One value, everywhere.
- **Scene Neutral** (rgba(184,204,224,0.5)): The muted stroke for non-semantic scene linework (chassis, frames, props); it never glows.
- **Panel Night** (rgba(13,21,37,0.6)): The only translucent surface, reserved for install code bars.
- **Star dots**: pure white radial-gradient points, 1–1.5px, opacity 0.2–0.3, `position: fixed` behind the page, breathing 0.75→1 opacity over 7s.

### Named Rules
**The Two Lights Rule.** Cyan means local/client; amber means server/safe. The assignments are never swapped, and neither accent is ever used as mere decoration — if a colored element doesn't carry that meaning, it stays neutral.

**The One Hairline Rule.** All borders and dividers in UI chrome use the single value rgba(184,204,224,0.16) at 1px. No second border color, no heavier weights.

## Typography

**Display/Body Font:** system sans (`-apple-system, 'Helvetica Neue', 'Segoe UI', sans-serif`)
**Mono Font:** system mono (`ui-monospace, 'SF Mono', Menlo, Consolas, monospace`) — install commands, inline `code`, and scene code text

**Character:** Neutral, quiet, and native — the type disappears behind the content. Hierarchy comes entirely from weight (400/600/700), size, and the ink/slate two-tone split; no webfonts are ever loaded.

### Hierarchy
- **Display** (700, clamp(1.75rem, 1.05rem + 4.8vw, 3.9rem), lh 1.12, ls −0.02em): The hero tagline only — two authored HTML lines under the star, Starlight Ink, at every width.
- **Wordmark** (600, 1rem, ls 0.34em, UPPERCASE): "HA NOVA" set in tracked Moonlit Slate between star and tagline; optically recentered by a matching left padding.
- **Headline** (700, clamp(1.875rem, 1.3rem + 2.4vw, 2.75rem), lh 1.2, ls −0.02em): Section headings (h2), balanced wrapping (`text-wrap: balance`), Starlight Ink.
- **Title** (600, 1.25rem, lh 1.2): Workflow step headings and sub-headings (h3), Starlight Ink.
- **Quote** (600, 1.1875rem, ls −0.01em): The "You say" utterances — body-scale but ink-colored and semibold so spoken lines lead their row.
- **Body** (400, 1.0625rem, lh 1.65): Default copy in Moonlit Slate; measure capped at 62ch (`--measure`), 52ch inside the workflow, 46ch for the hero subline.
- **Label** (600, 0.8125rem, ls 0.08em, UPPERCASE): Column headers and badges; always paired with an accent color that states whose side the column is.
- **Code** (0.9375rem mono): Install commands in Starlight Ink; inline `code` gets amber text on a faint amber chip.
- **Scene text** (SVG px units): labels 17px/600 in ink (28px in wide scenes below 720px); code text 22px/600 amber mono at ls 0.1em (small variant 14px, bumped to 22px in wide scenes below 720px); in-scene button text 12px/600 cyan.

### Named Rules
**The No-Webfont Rule.** The system stack is the brand voice. No font files, no CDN fonts, ever — self-containment is part of the product promise.

## Layout

A centered single-column one-pager. The hero is a centered stack on the open night (max 900px, top padding clamp(4rem, 12vh, 8rem)): star SVG at clamp(96px, 13vw, 148px), tracked wordmark, two-line display tagline, ≤46ch subline, two pill CTAs — the same composition at every width; there is no hero breakpoint swap. Sections cap at 1040px (the safety section deliberately narrows to 760px so the workflow reads like a document), with a constant 1.5rem side gutter. Vertical rhythm is one value: every section takes `clamp(5rem, 13vh, 8.5rem)` top padding and no bottom padding, so spacing between sections never doubles up.

Structure inside sections is hairline-topped rows and grids, not cards: the pairing steps are a 3-column grid (2.5rem gap) of hairline-topped items, each opening with its own small neon scene; the "You say / What happens" table is a 5fr/7fr two-column grid whose rows are separated by hairline bottoms; the ground rules are a 2-column grid of hairline-topped icon+text pairs; the skills-vs-tools comparison is a two-figure `1fr 1fr` grid (3rem gap) with centered ink captions. Leads sit directly under headings at 1.125rem with a 62ch measure.

Responsive behavior (content never scrolls the page horizontally; code bars scroll internally):
- **≤860px**: the ground-rules grid drops to one column; the versus comparison stacks to one centered column (max 26rem).
- **≤720px**: the says-table drops its header row and stacks each row (an inline uppercase cyan "You say" label is injected before quotes); pairing steps stack (their scenes cap at 17rem); buttons go full-width (max 20rem); the workflow indents tighter; wide-scene SVG text bumps up (labels 17→28px, small code 14→22px) to stay readable.

**Motion.** The easing voice is one curve, `--ease-rise: cubic-bezier(0.16, 1, 0.3, 1)`. The grammar:
- **Hero entrance**: staggered rise (translateY(16px) + fade, 1s) at delays 0 / 0.08s / 0.16s / 0.26s / 0.36s for star, wordmark, tagline, subline, CTAs.
- **Scroll reveals**: `[data-reveal]` elements fade up 18px over 0.7s when an IntersectionObserver (threshold 0.2, rootMargin −8% bottom) marks them `.inview`; siblings inside groups stagger in gentle 0.08s steps (workflow steps 0.12s steps).
- **Line drawing**: scene strokes carry `pathLength="1"` and draw via a dash transition (1s ease-out, 0.25s delay); the `.slow` variant (1.4s, 0.75s delay) is reserved for the cloud fallback arc so the cyan local link always draws first and the amber fallback second — the sequencing is semantic, not decorative.
- **Ambient**: the amber workflow thread scaleY-draws over 1.6s as the chain reveals; the starfield breathes (7s alternate); the terminal cursor blinks (`steps(1)`, 1.1s); buttons and the copy button press down with `scale(0.97)` over 0.16s on :active.
- **Safety nets**: everything above is gated behind `html.js` (set by a one-line head script) — without JS the page is fully visible and static — and `prefers-reduced-motion: reduce` disables every animation and transition listed here.

## Elevation & Depth

UI chrome is completely flat: no box-shadows, no glows, no layered surfaces. Depth is atmospheric instead — the fixed, breathing star field sits behind a scrolling page and the background gradient darkens toward the fold. The one sanctioned luminance is inside the authored scenes: semantic strokes glow softly via `filter: drop-shadow(0 0 5px <accent at 0.4 alpha>)`, reading as neon light in the night, not as elevation. The single translucent surface, Panel Night (rgba(13,21,37,0.6)) on code bars, reads as recessed glass, not as a lifted card.

### Named Rules
**The No-Shadow Rule.** UI chrome never casts a shadow and never glows — including (especially) the star logo. Only authored scene linework may glow, and only via the fixed 5px drop-shadow at 0.4 alpha of its own stroke color. If a chrome element needs separation, it gets a hairline, not elevation.

## Shapes

Two form languages coexist: pills and hairlines. Everything interactive or badge-like is a full pill (999px) — buttons, client chips, the Beta badge. Surfaces are softly rounded: code bars at 10px, inline code chips at 5px. Workflow step markers are 35px circles with a 1px amber border on a Night Mid fill, threaded on a 1px vertical amber gradient line (0.7 → 0.15 alpha).

Scene linework is single-stroke neon: `fill: none`, 2px strokes with round caps and joins (the relay tile steps up to 2.5px, the confirmation checkmark to 3px — weight tracks importance), semantic cyan/amber glowing strokes, non-glowing Scene Neutral (rgba(184,204,224,0.5)) for props, and generous rounded corners (the relay tile at 24px radius). UI icons are the same language at small scale: 22px rendered (24 viewBox), 1.5px strokes, round caps, no fills, no glow.

## Components

### Buttons
- **Shape:** Full pill (999px radius), 0.85rem 1.9rem padding, semibold (600) at 1.0625rem.
- **Primary:** Solid Nova Cyan fill with Abyss Ink (#05121D) text; hover brightens the fill to #4FCDF6.
- **Ghost:** Transparent with a 1px hairline border and Starlight Ink text; hover raises the border to Moonlit Slate.
- **Press:** :active scales to 0.97 over 0.16s ease-out.
- **Focus:** All interactive elements share `outline: 2px solid` cyan, offset 3px.
- Transitions: background/color/border 0.2s ease. On ≤720px, buttons go full-width (max 20rem), centered text.

### Chips
- **Client chips** ("Works with" list): pill, 1px hairline border, no fill, body-color text at 0.9375rem, 0.35rem 1rem padding. Inline qualifiers (e.g. "preview") in cyan at 0.8125rem.
- **Beta badge:** pill, 1px amber border at 0.55 alpha, amber uppercase label text (0.75rem, ls 0.1em), no fill.

### List Rows (instead of cards)
The system's replacement for cards: content blocks open with a 1px hairline top and ~1.1–1.5rem padding beneath it. Used by pairing steps (small neon scene, cyan counter numeral, ink-bold title line), says-rows (hairline bottoms, 1.4rem vertical padding), ground rules (amber line icon + text), and the footer story. No backgrounds, no radii, no borders on the other three sides.

### Code Bars
The only "panel" on the page: a flex bar with 1px hairline border, 10px radius, Panel Night translucent fill. Inside, a `pre` (0.9rem 1.1rem padding, internal horizontal scroll) and a Copy button separated by a hairline left border — cyan text, transparent fill, hover tint rgba(24,188,242,0.12), :active scale(0.97), and a 2s "Copied!" state that flips the label to amber (the change is now on the safe side).

### Navigation
None. The page is a one-pager with two hero CTAs (anchor + GitHub) and a hairline-topped footer link row (slate links that brighten to ink on hover). Body links elsewhere are cyan with 1px underlines offset 3px.

### Neon Scenes (signature imagery)
All imagery is authored inline SVG with class `.scene` (`overflow: visible`, full-width, `role="img"` + descriptive `aria-label`). Stroke classes: `.c` cyan glowing, `.a` amber glowing, `.n` Scene Neutral non-glowing; `.dim` drops a stroke to 0.75 opacity. Strokes are 2px round-capped (2.5px relay tile, 3px checkmark). In-scene text uses the scene text ramp (labels 17px ink, code 22px amber mono, buttons 12px cyan); the terminal cursor blinks. Strokes marked `pathLength="1"` draw themselves on reveal; `.slow` sequences the amber cloud arc after the cyan local link. Small scenes (240×160) open the pairing steps; wide scenes (`.scene-wide`, 800×340 / 900×360) sit in `<figure>`s with centered ink captions (visually hidden when the lead already says it); the versus pair is 380×250. Follow the Two Lights semantics in every new scene.

### The Safety Timeline (signature component)
The page centerpiece: an ordered list threaded on a 1px vertical amber gradient line (top 0.7 alpha fading to 0.15) that scaleY-draws over 1.6s as the chain scrolls into view, each step marked by a 35px circle — 1px amber border at 0.55 alpha, Night Mid fill, amber bold numeral — revealing at 0.12s staggers. Step content indents 4rem (3.25rem ≤720px): a 600-weight 1.25rem ink heading and a ≤52ch slate paragraph. Amber `code` chips (amber text, 10%-alpha amber fill, 30%-alpha amber border, 5px radius) mark commands like `revert`. Everything about this component is amber: it is the server-side safety promise rendered as a form.

## Do's and Don'ts

### Do:
- **Do** ship the star only as its original SVGs (`assets/logo.svg`, `assets/icon.svg`) — placed, sized, and nothing else.
- **Do** keep cyan (#18BCF2) for local/client meaning and amber (#FFB347) for server/safe meaning in every new surface, scene, and column label.
- **Do** structure new content as hairline-topped rows and grids on the bare gradient, reusing rgba(184,204,224,0.16) at 1px.
- **Do** keep WCAG AA contrast on the dark theme: body text in #B8CCE0, lead text in #E8EDF2, and #05121D text on cyan fills.
- **Do** author new imagery as inline-SVG neon scenes: 2px single strokes, round caps, no fills, cyan/amber glow at the fixed 5px/0.4-alpha drop-shadow, Scene Neutral for props, `role="img"` with a real `aria-label`.
- **Do** gate any new motion behind `html.js` and `[data-reveal]`, use `--ease-rise` as the easing voice, keep line-draw sequencing semantic (local before fallback), and disable it all under `prefers-reduced-motion`.

### Don't:
- **Don't** redraw, distort, glow, shadow, or CSS-rebuild the star — the mark is sacred and ships only as the vendored SVG.
- **Don't** swap or dilute the accent semantics — no cyan safety elements, no amber CTAs, no third accent color.
- **Don't** load webfonts, CDN assets, or any external resource; the page stays fully self-contained (all imagery is inline SVG).
- **Don't** introduce cards, box-shadows, or UI-chrome glows; glow belongs to scene linework only, and separation comes from hairlines and whitespace.
- **Don't** let the page scroll horizontally at any width — wide content (code, tables) scrolls inside its own container.
- **Don't** make content depend on JavaScript or motion: no-JS and reduced-motion visitors must see the complete page at rest.
