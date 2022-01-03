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

echo "·${purple} npm config set init.author.name \"${npmusername:-$npmusernamedefault}\"${reset}"
npm config set init.author.name "${npmusername:-$npmusernamedefault}"
echo "·${purple} npm config set init.author.email \"${npmuseremail:-$npmuseremaildefault}\"${reset}"
npm config set init.author.email "${npmuseremail:-$npmuseremaildefault}"
echo "·${purple} npm config set init.author.url \"${userurl:-$urldefault}\"${reset}"
npm config set init.author.url "${userurl:-$urldefault}"
echo "·${purple} npm config set init.license \"${userlicense:-$userlicensedefault}\"${reset}"
npm config set init.license "${userlicense:-$userlicensedefault}"

