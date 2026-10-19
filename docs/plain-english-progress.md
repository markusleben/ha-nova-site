# Plain-English + visuals rework — progress (WIP, remove before merge)

Branch `content/plain-english`, worktree `../ha-nova-site-wt-plain`. Scratchpad (screenshots, tools):
`/private/tmp/claude-501/-Users-markus-Daten-Development-Privat-ha-nova/7667c533-3c5f-4fe3-836c-dbbf5c43c33a/scratchpad/plain-english/`
(tools: `../tools/fk.py` = Flesch-Kincaid, `../tools/shots.py` = Chrome screenshots; `../before/` = original pages).

## Done (checkpoint 1)
- index.html, demo/index.html, privacy.html rewritten in plain English; facts checked against v0.26.0 README.
- Hero: "Talk to your home. Every change checked." + 25-word sub-line. Meta/OG/Twitter updated.
- New/redrawn inline-SVG scenes: terminal prompt, HA login with house + Sign in press, laptop with house window lighting up,
  chat bubbles (reply types, lands with check), shield emblem (settles, check draws), confirm trio
  (window Confirm / phone tap / code typed), cloud labels ("At home: direct", "Away: Home Assistant Link"),
  how-it-works redrawn (computer = AI app + skills, request pulse through relay, HA window lights; stale "428 316" code chip removed),
  skills-vs-tools pile tumbles / skill handed over, demo house with hourly reset arrow.
- Motion: all under `prefers-reduced-motion: no-preference` + `html.js` + `.inview` (once); rest state = final frame.
- assets/social-preview.png re-rendered from the untouched icon.svg with the new tagline.
- check-sync.sh passes against v0.26.0 README.

## FK grade (prose: p/li/figcaption, headings excluded)
index 8.5 -> 4.0 (hero sub 23.8 -> 2.9, 52 -> 25 words) · demo 6.0 -> 4.8 · privacy 9.3 -> 5.4

## Headline options
1. Talk to your home. Every change checked. (picked)
2. Sign in once. Every change checked.
3. Your AI runs the house. You stay in charge.

## Next
- after-screenshots desktop/mobile + animation frame sequences into scratchpad
- impeccable detect + finish review; fact/safety/visual reviewer subagent; fix batch
- DESIGN.md: record new scene types, lit-window fill exception, motion grammar
- remove this file, open PR (no merge)
