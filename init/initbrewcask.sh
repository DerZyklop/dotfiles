#!/bin/sh

# info: http://caskroom.io/

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

HOMEBREW_CASK_FORMULAE=(
    "little-snitch"
    "gpgtools"

    "sublime-text3"
    "bittorrent-sync"
    "dropbox"

    "google-chrome"
    "opera"
    "firefox"

    "licecap"
    "caffeine"
    "appcleaner"
    "the-unarchiver"
    "imageoptim"

    "vlc"
    "spotify"
)

for i in ${!HOMEBREW_CASK_FORMULAE[*]}; do
  tmp="${HOMEBREW_CASK_FORMULAE[$i]}"
  echo "installing ${purple}$tmp${reset}"
  brew cask install $tmp
done
