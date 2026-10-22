#!/usr/bin/env bash
# Is hanova.app still in sync with the product README?
#   bash scripts/check-sync.sh <path-to-product-README.md>
# Fails (exit 1) and says why when:
#   - the README changed since the last recorded sync (.readme-sync holds its sha256),
#   - an install command from the README is not on the page verbatim,
#   - the page shows a version number or the word "Add-on",
#   - a stylesheet link lacks the current styles.css content hash,
#   - a page's top bar lost its demo or GitHub link (findability),
#   - a link that leaves hanova.app doesn't open in a new tab.
# After syncing the page to a new README: sha256 of that README -> .readme-sync.
set -euo pipefail

readme="${1:?usage: check-sync.sh <README.md>}"
page="index.html"
fail=0
say() { echo "check-sync: $*"; fail=1; }

want="$(tr -d '[:space:]' < .readme-sync)"
have="$(shasum -a 256 "$readme" | cut -d' ' -f1)"
[[ "$want" == "$have" ]] || say "the product README changed since the last site sync (recorded $want, now $have) — diff it against the page and update .readme-sync"

found=0
while IFS= read -r cmd; do
  found=$((found + 1))
  grep -qF "$cmd" "$page" || say "install command missing or changed on the page: $cmd"
  grep -qF "$cmd" demo/index.html || say "install command missing or changed on demo/index.html: $cmd"
done < <(grep -E '^(curl -fsSL https://raw\.githubusercontent\.com/markusleben/ha-nova/main/install\.sh \| bash|irm https://raw\.githubusercontent\.com/markusleben/ha-nova/main/install\.ps1 \| iex)$' "$readme")
[[ "$found" -eq 2 ]] || say "expected the 2 known install commands in the README, found $found — did an install command change?"

grep -qiE 'add-on' "$page" && say 'the page says "Add-on" (use "App")'
# raw source, so attributes (alt, aria-label, meta/og) count too
grep -qE '\bv?[0-9]+\.[0-9]+\.[0-9]+\b' "$page" && say "the page shows a version number"

# stylesheet links carry styles.css's content hash, so browsers fetch new CSS right after a deploy
css="$(shasum -a 256 styles.css | cut -c1-10)"
for f in index.html privacy.html demo/index.html 404.html; do
  grep -q "styles.css?h=$css" "$f" || say "$f: stylesheet link must be styles.css?h=$css (styles.css changed — update the hash)"
done

# every page keeps the demo and GitHub one click away, in its top bar
for f in index.html privacy.html demo/index.html 404.html; do
  bar="$(sed -n '/<header class="topbar">/,/<\/header>/p' "$f")"
  [[ -n "$bar" ]] || { say "$f: the top bar (<header class=\"topbar\">) is missing"; continue; }
  grep -qF 'href="https://github.com/markusleben/ha-nova"' <<<"$bar" || say "$f: the top bar lost its GitHub link"
  grep -qE 'href="(\.\./|/)?demo/"|href="\./" aria-current="page">Try the demo' <<<"$bar" || say "$f: the top bar lost its demo link"
done

# links that leave hanova.app open in a new tab (and say so to screen readers)
for f in index.html privacy.html demo/index.html 404.html; do
  while IFS= read -r tag; do
    say "$f: external link without target=\"_blank\" rel=\"noopener noreferrer\": $tag"
  done < <(grep -oE '<a [^>]*href="https?://[^"]*"[^>]*>' "$f" | grep -vE 'href="https://hanova\.app[/"]' | grep -v 'target="_blank" rel="noopener noreferrer"' || true)
done

exit "$fail"
