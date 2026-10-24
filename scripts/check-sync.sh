#!/usr/bin/env bash
# Is hanova.app still in sync with the product README?
#   bash scripts/check-sync.sh <path-to-product-README.md> [<banned-wording.json>]
# Fails (exit 1) and says why when:
#   - the README changed since the last recorded sync (.readme-sync holds its sha256),
#   - an install command from the README is not on the page verbatim,
#   - the page shows a version number or the word "Add-on",
#   - a stylesheet link lacks the current styles.css content hash,
#   - a page's top bar lost its demo or GitHub link (findability),
#   - a link that leaves hanova.app doesn't open in a new tab,
#   - a page uses a phrase from the product's banned list (tests/docs/banned-wording.json
#     in markusleben/ha-nova; default: next to the README, as in a product checkout).
# After syncing the page to a new README: sha256 of that README -> .readme-sync.
set -euo pipefail

readme="${1:?usage: check-sync.sh <README.md> [<banned-wording.json>]}"
banned="${2:-$(dirname "$readme")/tests/docs/banned-wording.json}"
[[ -r "$banned" ]] || { echo "check-sync: banned list not found: $banned" >&2; exit 2; }
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

# the product's banned wording (scope "all") on every page; same rules as
# the product's tests/docs/canonical-wording.test.ts. Tags become their attribute
# values (alt, aria-label, meta content count), entities are decoded, and each line
# is matched with its neighbours so a phrase wrapped across lines still counts.
# Allowed exceptions: rule, file, line snippet (tab-separated), one per line, each with its reason.
#   link-old-name in index.html: names the old menu people may still see in Home Assistant.
ALLOW="$(printf '%s\t%s\t%s\n' \
  link-old-name index.html "Your Settings may still call it Home Assistant Cloud")"
hits="$(ALLOW="$ALLOW" perl -CSD -Mutf8 -MJSON::PP -MDigest::SHA=sha256_hex -e '
  my ($list, @pages) = @ARGV;
  open my $fh, "<", $list or die "$list: $!"; my $rules = JSON::PP->new->decode(do { local $/; <$fh> })->{rules};
  my @allow = map { [split /\t/] } grep { length } split /\n/, $ENV{ALLOW};
  my %ent = (gt => ">", lt => "<", amp => "&", quot => "\"", apos => "\x27", nbsp => " ", rarr => "\x{2192}", rsquo => "\x{2019}", ldquo => "\x{201c}", rdquo => "\x{201d}", lsquo => "\x{2018}", rsaquo => "\x{203a}", raquo => "\x{bb}", ndash => "\x{2013}", mdash => "\x{2014}");
  for my $file (@pages) {
    open my $ph, "<", $file or die "$file: $!"; my $src = do { local $/; <$ph> };
    $src =~ s{<[^>]*>}{ my $t = $&; " " . join(" ", $t =~ /="([^"]*)"/g) . " " . ("\n" x ($t =~ tr/\n//)) }ge;
    $src =~ s/&#x([0-9a-f]+);/chr hex $1/gie; $src =~ s/&#(\d+);/chr $1/ge; $src =~ s{&(\w+);}{$ent{$1} // "&$1;"}ge;
    $src =~ tr/\x{a0}\x{2011}/ -/;
    my @l = split /\n/, $src, -1;
    for my $r (grep { $_->{scope} eq "all" } @$rules) {
      for my $i (0 .. $#l) {
        my ($p, $n) = ($i ? $l[$i - 1] : "", $l[$i + 1] // "");
        my ($from, $to) = (length($p) + 1, length($p) + 1 + length $l[$i]);
        my $text = "$p $l[$i] $n";
        my @hit;
        if ($r->{sha256}) {
          my %bad = map { $_ => 1 } @{ $r->{sha256} };
          while ($l[$i] =~ /($r->{words})/gi) {
            my @part = split /[-_]/, lc $1;
            for my $s (0 .. $#part) { for my $e ($s .. $#part) { my $w = join "-", @part[$s .. $e]; push @hit, $w if $bad{ sha256_hex($w) } } }
          }
        } else {
          my $re = $r->{flags} =~ /i/ ? qr/(?ai)$r->{pattern}/ : qr/(?a)$r->{pattern}/;
          while ($text =~ /$re/g) { push @hit, $& if $-[0] >= $from && $-[0] < $to }
        }
        next unless @hit;
        next if grep { $_->[0] eq $r->{id} && $_->[1] eq $file && index($l[$i], $_->[2]) >= 0 } @allow;
        print "$file:", $i + 1, ": \"$_\" — $r->{why} Use: $r->{use}\n" for @hit;
      }
    }
  }' "$banned" index.html demo/index.html privacy.html 404.html)" || say "the banned-wording check could not run (see the error above)"
while IFS= read -r line; do
  [[ -z "$line" ]] || say "$line"
done <<<"$hits"

exit "$fail"
