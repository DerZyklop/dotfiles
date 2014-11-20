#!/bin/sh

# info: http://caskroom.io/

brew tap caskroom/fonts

HOMEBREW_CASK_FORMULAE=(
    "font-amaranth"
    "font-droid-sans-mono"
    "font-droid-sans"
    "font-droid-serif"
    "font-merriweather"
    "font-source-code-pro"
    "font-fira-sans"
    "font-league-gothic"
)

for i in ${!HOMEBREW_CASK_FORMULAE[*]}; do
  tmp="${HOMEBREW_CASK_FORMULAE[$i]}"
  echo "installing ${purple}$tmp${reset}"
  brew cask install $tmp
done
