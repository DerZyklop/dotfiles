#!/bin/sh

if ! commandExists "brew"; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update
# Upgrade any already-installed formulae.
brew upgrade
brew cleanup

HOMEBREW_FORMULAE=(
    "bash-completion"
    "git"
    "node"
    "vim --override-system-vi"
    "nmap"
    "todo-txt"
    "wget"
    "blink1"
)

for i in ${!HOMEBREW_FORMULAE[*]}; do
  tmp="${HOMEBREW_FORMULAE[$i]}"
  echo "installing ${purple}$tmp${reset}"
  $(brew install $tmp)
done
