#!/bin/sh

## If brew gives a 'permission denied':
## chown $(whoami):admin /Library/Caches/Homebrew/Formula/

echo "⬇${purple} ./init/brew_dependencies.sh${reset}"

### Read the new dotfiles once
for file in $DOTFILESDIR/.{exports,path,completions,bash_prompt,aliases,functions,extra,bashrc}; do
  if [ -r "$file" ] && [ -f "$file" ]; then
    echo "·${purple} source \"$file\"${reset}"
    source "$file";
  fi
done;

if ! commandExists "brew"; then
  echo "·${purple} ruby -e \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"${reset}"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
echo "·${purple} brew update${reset}"
brew update
# Upgrade any already-installed formulae.
echo "·${purple} brew upgrade${reset}"
brew upgrade
echo "·${purple} brew cleanup${reset}"
brew cleanup

# for Dr. Plano
brew install --cask homebrew/cask-versions/adoptopenjdk8
brew tap adoptopenjdk/openjdk
brew install --cask adoptopenjdk11

echo "·${purple} brew bundle install --file=~/.dotfiles/.brewfile${reset}"
brew bundle install --file=~/.dotfiles/.brewfile

sudo easy_install Pygments
echo '-' > ~/.bash_history
