#!/bin/sh

# info: http://caskroom.io/

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

HOMEBREW_CASK_FORMULAE=(
    "sublime-text3"
    "bittorrent-sync"
    "dropbox"

    "google-chrome"
    "opera"
    "firefox"

    "licecap"
    "caffeine"
    "appcleaner"
    "vlc"
    "the-unarchiver"
)

for i in ${!HOMEBREW_CASK_FORMULAE[*]}; do
  tmp="${HOMEBREW_CASK_FORMULAE[$i]}"
  echo ${purple}$tmp${reset}
  brew cask install $tmp
done
