#!/bin/sh

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
sudo git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL=$npmuseremaildefault
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
sudo git config --global user.email "$GIT_AUTHOR_EMAIL"

read -p "npm name ($npmusernamedefault): " npmusername
read -p "npm email ($npmuseremaildefault): " npmuseremail
read -p "npm author url ($urldefault): " userurl
read -p "npm license ($userlicensedefault): " userlicense

npm config set init.author.name "${npmusername:-$npmusernamedefault}"
npm config set init.author.email "${npmuseremail:-$npmuseremaildefault}"
npm config set init.author.url "${userurl:-$urldefault}"
npm config set init.license "${userlicense:-$userlicensedefault}"

