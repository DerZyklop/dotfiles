#!/bin/sh

# info: http://caskroom.io/

## If brew gives a 'permission denied':
## chown $(whoami):admin /Library/Caches/Homebrew/Formula/

echo "⬇${purple} ./init/software.sh${reset}"

echo "·${purple} brew tap caskroom/cask${reset}"
brew tap caskroom/cask
echo "·${purple} brew tap caskroom/versions${reset}"
brew tap caskroom/versions

software=(
    # Essentials
    "little-snitch"
    "dropbox"
    "1password"

    # Developement
    "atom"
    # "sublime-text3"
    #"bittorrent-sync"
    "sourcetree"

    # Browsers
    "google-chrome"
    "opera"
    "firefox"
    "chromium"

    # Work-Related
    "dash"
    "sketch"
    "transmit"
    "gifox"
    # "minco"
    # "colorsnapper" // baught in AppStore

    # Plano
    "perforce"
    "p4v"

    # Communication
    "telegram"
    # TODO: add tweetdeck to brew cask

    # Other
    "licecap"
    "caffeine"
    "appcleaner"
    "hazel"
    "default-folder-x"
    "the-unarchiver"
    "imageoptim"
    "image-tool"
    "cinch"
    "daisydisk"
    "isolator"
    "sizeup"
    "synology-assistant"
    "moneymoney"
    "transmission"
    # add clear to brew cask
    # add clippings to brew cask

    # Media
    "vlc"
    "spotify"
    "instacast"

    # Fuck you too, NSA 😎!
    "gpgtools"
    "torbrowser"
    "truecrypt"
)

echo "·${purple} brew cask install --appdir=/Applications ${software[@]}${reset}"
brew cask install --appdir=/Applications ${software[@]}
