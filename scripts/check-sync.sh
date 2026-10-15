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

while IFS= read -r cmd; do
  grep -qF "$cmd" "$page" || say "install command missing or changed on the page: $cmd"
done < <(grep -E '^(curl -fsSL https://raw\.githubusercontent\.com/markusleben/ha-nova/main/install\.sh \| bash|irm https://raw\.githubusercontent\.com/markusleben/ha-nova/main/install\.ps1 \| iex)$' "$readme")

grep -qiE 'add-on' "$page" && say 'the page says "Add-on" (use "App")'
grep -qE '\bv?[0-9]+\.[0-9]+\.[0-9]+\b' <(sed -e 's/<[^>]*>//g' "$page") && say "the page shows a version number"

exit "$fail"
