#!/usr/bin/env bash
# Is hanova.app still in sync with the product README?
#   bash scripts/check-sync.sh <path-to-product-README.md>
# Fails (exit 1) and says why when:
#   - the README changed since the last recorded sync (.readme-sync holds its sha256),
#   - an install command from the README is not on the page verbatim,
#   - the page shows a version number or the word "Add-on".
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

exit "$fail"
