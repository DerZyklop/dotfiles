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
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL=$npmuseremaildefault
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"

read -p "npm name ($npmusernamedefault): " npmusername
read -p "npm email ($npmuseremaildefault): " npmuseremail
read -p "npm author url ($urldefault): " userurl
read -p "npm license ($userlicensedefault): " userlicense

npm config set init.author.name "${npmusername:-$npmusernamedefault}"
npm config set init.author.email "${npmuseremail:-$npmuseremaildefault}"
npm config set init.author.url "${userurl:-$urldefault}"
npm config set init.license "${userlicense:-$userlicensedefault}"

# Define a global .gitignore file.
git config --global core.excludesfile '~/.gitignore'

# Erlaube Git Kommandos farbige Ausgaben, falls möglich
git config --global color.ui auto

# Good explanation of git's fast forwarding: http://ariya.ofilabs.com/2013/09/fast-forward-git-merge.html

# Deaktiviere die Belehrungen durch Git wenn Du etwas pushen möchtest was nicht fast forwardable ist
git config --global advice.pushNonFastForward false

# Setzte no fast-forward als Standardeinstellung
git config branch.master.mergeoptions  "--no-ff"

# Deaktiviere die “how to stage/unstage/add” Tips durch git status:
git config --global advice.statusHints false

# Erlaube git diffdie Erkennung einfacher Umbenennungen und Kopien:
git config --global diff.renames copies
