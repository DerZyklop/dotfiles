#!/bin/sh

# info: https://github.com/Homebrew/homebrew-cask-fonts

echo "⬇${purple} ./init/fonts.sh${reset}"
brew tap homebrew/cask-fonts
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
    "font-ia-writer-duo"
    "font-ia-writer-duospace"
    "font-ia-writer-quattro"
    "font-ia-writer-mono"
    "font-league-gothic"
    "font-merriweather"
    "font-monda"
    "font-neucha"
    "font-signika"
    "font-source-code-pro"
    "font-titillium-web"
    "font-vollkorn"
    "font-fira-code"
    "font-fantasque-sans-mono"
)

for i in ${!FONTS[*]}; do
  item="${FONTS[$i]}"
  echo "·${purple} brew cask install $item${reset}"
  $(brew cask install $item)
done
