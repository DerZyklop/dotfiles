#!/bin/sh

echo "⬇${purple} ./init/git_and_npm_defaults.sh${reset}"

gitusernamedefault="$(git config user.name)"
gituseremaildefault="$(git config user.email)"

read -p "Git name ($gitusernamedefault): " gitusername
read -p "Git email ($gituseremaildefault): " gituseremail

npmusernamedefault="${gitusername:-$gitusernamedefault}"
npmuseremaildefault="${gituseremail:-$gituseremaildefault}"
urldefault="$(npm config get init.author.url)"
userlicensedefault="MIT"

GIT_AUTHOR_NAME=$npmusernamedefault
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"

echo "·${purple} sudo git config --global user.name \"$GIT_AUTHOR_NAME\"${reset}"
sudo git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL=$npmuseremaildefault
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
echo "·${purple} sudo git config --global user.email \"$GIT_AUTHOR_EMAIL\"${reset}"
sudo git config --global user.email "$GIT_AUTHOR_EMAIL"

read -p "npm name ($npmusernamedefault): " npmusername
read -p "npm email ($npmuseremaildefault): " npmuseremail
read -p "npm author url ($urldefault): " userurl
read -p "npm license ($userlicensedefault): " userlicense

# Fall back to the defaults when the user just pressed enter
npmusername="${npmusername:-$npmusernamedefault}"
npmuseremail="${npmuseremail:-$npmuseremaildefault}"
userurl="${userurl:-$urldefault}"
userlicense="${userlicense:-$userlicensedefault}"

# ---------------------------------------------------------------------------
# npm init defaults
#
# `npm config set init.author.*` / `init.license` are deprecated in npm >= 10
# and can no longer be written that way, so we write ~/.npmrc directly instead
# using the hyphenated key names npm still understands on read.
# No sudo: this is the current user's npm config, not root's.
# Each key is upserted so re-running this script stays idempotent.
# ---------------------------------------------------------------------------
npmrcfile="$HOME/.npmrc"

upsert_npmrc() {
  key="$1"
  val="$2"
  [ -z "$val" ] && return 0
  [ -f "$npmrcfile" ] || : > "$npmrcfile"
  tmp="$(mktemp)"
  grep -v "^${key}=" "$npmrcfile" > "$tmp" 2>/dev/null || true
  mv "$tmp" "$npmrcfile"
  printf '%s=%s\n' "$key" "$val" >> "$npmrcfile"
}

echo "·${purple} init-author-name=\"$npmusername\"  -> ~/.npmrc${reset}"
upsert_npmrc "init-author-name" "$npmusername"
echo "·${purple} init-author-email=\"$npmuseremail\"  -> ~/.npmrc${reset}"
upsert_npmrc "init-author-email" "$npmuseremail"
echo "·${purple} init-author-url=\"$userurl\"  -> ~/.npmrc${reset}"
upsert_npmrc "init-author-url" "$userurl"
echo "·${purple} init-license=\"$userlicense\"  -> ~/.npmrc${reset}"
upsert_npmrc "init-license" "$userlicense"

echo "·${green} npm init defaults written to ~/.npmrc${reset}"

