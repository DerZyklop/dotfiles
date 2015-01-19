#!/bin/sh

# info: http://caskroom.io/

brew tap caskroom/fonts

HOMEBREW_CASK_FORMULAE=(
    "font-alegreya"
    "font-alegreya-sc"
    "font-alegreya-sans"
    "font-alegreya-sans-sc"
    "font-amaranth"
    "font-bitter"
    "font-droid-sans-mono"
    "font-droid-sans"
    "font-droid-serif"
    "font-fira-sans"
    "font-league-gothic"
    "font-merriweather"
    "font-source-code-pro"
    "font-titillium-web"
    "font-vollkorn"
)

for i in ${!HOMEBREW_CASK_FORMULAE[*]}; do
  tmp="${HOMEBREW_CASK_FORMULAE[$i]}"
  echo "installing ${purple}$tmp${reset}"
  brew cask install $tmp
done
