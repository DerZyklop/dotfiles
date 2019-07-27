#!/bin/sh

echo "⬇${purple} ./init/commandline_interfaces.sh${reset}"

### Read the new dotfiles once
for file in $DOTFILESDIR/.{exports,path,completions,bash_prompt,aliases,functions,extra,bashrc}; do
  if [ -r "$file" ] && [ -f "$file" ]; then
    echo "·${purple} source \"$file\"${reset}"
    source "$file";
  fi
done;

if ! commandExists "brew"; then
  echo "·${purple} ruby -e \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"${reset}"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
echo "·${purple} brew update${reset}"
brew update
# Upgrade any already-installed formulae.
echo "·${purple} brew upgrade${reset}"
brew upgrade
echo "·${purple} brew cleanup${reset}"
brew cleanup

HOMEBREW_FORMULAE=(
  "bash-completion"
  "git"
  "node"
  "vim --override-system-vi"
  "nmap"
  "wget"
  "blink1"
  "prettyping"

  # For Wordpress
  # "homebrew/php/wp-cli"

  # for Dr. Plano
  "postgresql"
  "maven"
)

# for Dr. Plano
brew cask install java8

for i in ${!HOMEBREW_FORMULAE[*]}; do
  tmp="${HOMEBREW_FORMULAE[$i]}"
  echo "·${purple} brew install $tmp${reset}"
  $(brew install $tmp)
done

sudo easy_install Pygments
echo '-' > ~/.bash_history
