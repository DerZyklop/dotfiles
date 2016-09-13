#!/bin/sh

# info: http://caskroom.io/

## If brew gives a 'permission denied':
## chown $(whoami):admin /Library/Caches/Homebrew/Formula/

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

software=(
    # Essentials
    "little-snitch"
    # TODO: add 1password to brew cask (https://d13itkw33a7sus.cloudfront.net/dist/1P/mac4/1Password-4.4.1.zip)

    # Developement
    "sublime-text3"
    "bittorrent-sync"
    "sourcetree"

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
    "synology-assistant"
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

echo "installing ${purple}software${reset}"
brew cask install --appdir=/Applications ${software[@]}

brew cask install --appdir=/Applications dropbox
echo "${green}Log in to Dropbox.app"
open /Applications/Dropbox.app
read -p "Press [ENTER] to continue..."
