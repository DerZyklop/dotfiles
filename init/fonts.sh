#!/bin/sh

# info: http://caskroom.io/

echo "⬇${purple} ./init/fonts.sh${reset}"
brew tap caskroom/fonts
echo "·${purple} brew tap caskroom/fonts${reset}"

FONTS=(
    "font-alegreya"
    "font-alegreya-sans"
    "font-alegreya-sans-sc"
    "font-alegreya-sc"
    "font-amaranth"
    "font-asap"
    "font-bitter"
    "font-catamaran"
    "font-chau-philomene-one"
    "font-droid-sans"
    "font-droid-sans-mono"
    "font-droid-serif"
    "font-enriqueta"
    "font-fira-sans"
    "font-fira-mono"
    "font-league-gothic"
    "font-merriweather"
    "font-monda"
    "font-neucha"
    "font-signika"
    "font-source-code-pro"
    "font-titillium-web"
    "font-vollkorn"
)

for i in ${!FONTS[*]}; do
  item="${FONTS[$i]}"
  echo "·${purple} brew cask install $item${reset}"
  $(brew cask install $item)
done

