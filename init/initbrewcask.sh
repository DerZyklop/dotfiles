#!/bin/sh

# info: http://caskroom.io/

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

HOMEBREW_CASK_FORMULAE=(
    # Essentials
    "little-snitch"
    # TODO: add 1password to brew cask (https://d13itkw33a7sus.cloudfront.net/dist/1P/mac4/1Password-4.4.1.zip)

    # Developement
    "sublime-text3"
    "bittorrent-sync"
    "dropbox"

    # Browsers
    "google-chrome"
    "opera"
    "firefox"
    "chromium"

    # Work-Related
    "minco"
    "dash"
    "sketch"
    "transmit"

    # Communication
    "telegram"
    # TODO: add tweetdeck to brew cask

    # Little Helper
    "licecap"
    "caffeine"
    "appcleaner"
    "hazel"
    "default-folder-x"
    "the-unarchiver"
    "imageoptim"
    "image-tool"
    "cinch"
    "cloud"
    "daisydisk"
    "isolator"
    "sizeup"
    # add clear to brew cask
    # add clippings to brew cask

    # Media
    "vlc"
    "spotify"
    "instacast"

    # Fuck you too, NSA!
    "gpgtools"
    "torbrowser"
    "truecrypt"
)

for i in ${!HOMEBREW_CASK_FORMULAE[*]}; do
  tmp="${HOMEBREW_CASK_FORMULAE[$i]}"
  echo "installing ${purple}$tmp${reset}"
  brew cask install $tmp
done
