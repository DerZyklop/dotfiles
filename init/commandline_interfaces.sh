#!/bin/sh

### Read the new dotfiles once
for file in $DOTFILESDIR/.{exports,path,completions,bash_prompt,aliases,functions,extra,bashrc}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

if ! commandExists "brew"; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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

sudo easy_install Pygments
