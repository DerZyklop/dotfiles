#!/bin/sh

function commandExists() {
  if ! foobar_loc="$(type -p "$1")" || [ -z "$foobar_loc" ]; then
    return 1
  else
    return 0
  fi
}

if ! commandExists "brew"; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

brew update
brew upgrade
brew cleanup

HOMEBREW_FORMULAE=(
    "bash-completion"
    "git"
    "node"
    "vim --override-system-vi"
    "nmap"
)

for i in ${!HOMEBREW_FORMULAE[*]}; do
  tmp="${HOMEBREW_FORMULAE[$i]}"
  echo ${purple}$tmp${reset}
  $(brew install $tmp)
done
