#!/bin/sh

# info: http://caskroom.io/

brew tap caskroom/fonts

fonts=(
    "font-alegreya"
    "font-alegreya-sc"
    "font-alegreya-sans"
    "font-alegreya-sans-sc"
    "font-amaranth"
    "font-bitter"
    "font-chau-philomene-one"
    "font-droid-sans-mono"
    "font-droid-sans"
    "font-droid-serif"
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

echo "installing ${purple}fonts${reset}"
brew cask install ${fonts[@]}
