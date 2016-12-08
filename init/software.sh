#!/bin/sh

# info: http://caskroom.io/

## If brew gives a 'permission denied':
## chown $(whoami):admin /Library/Caches/Homebrew/Formula/

echo "⬇${purple} ./init/software.sh${reset}"

echo "·${purple} brew install caskroom/cask/brew-cask${reset}"
brew install caskroom/cask/brew-cask
echo "·${purple} brew tap caskroom/versions${reset}"
brew tap caskroom/versions

software=(
    # Essentials
    "little-snitch"
    "1password"

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

echo "·${purple} brew cask install --appdir=/Applications ${software[@]}${reset}"
brew cask install --appdir=/Applications ${software[@]}

echo "·${purple} brew cask install --appdir=/Applications dropbox${reset}"
brew cask install --appdir=/Applications dropbox
echo "${green}Log in to Dropbox.app"
open /Applications/Dropbox.app
read -p "Press [ENTER] to continue..."
