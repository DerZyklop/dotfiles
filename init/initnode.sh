#!/bin/sh

if ! commandExists "npm"; then
  brew install node
fi

npm update -g npm

HOMEBREW_FORMULAE=(
    "grunt"
    "grunt-cli"
    "prompt"
)

for i in ${!HOMEBREW_FORMULAE[*]}; do
  tmp="${HOMEBREW_FORMULAE[$i]}"
  echo "installing ${purple}$tmp${reset}"
  npm install -g $tmp
done
