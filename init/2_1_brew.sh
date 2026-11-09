#!/bin/sh

## If brew gives a 'permission denied':
## chown $(whoami):admin /Library/Caches/Homebrew/Formula/

echo "⬇${purple} ./init/2_1_brew.sh${reset}"

### Read the new dotfiles once
for file in $DOTFILESDIR/.{exports,path,completions,bash_prompt,aliases,functions,extra,bashrc}; do
  if [ -r "$file" ] && [ -f "$file" ]; then
    echo "·${purple} source \"$file\"${reset}"
    source "$file";
  fi
done;

# .path sets DOTFILES_BREW_PREFIX to the Homebrew folder of this user.
if [ -O "$DOTFILES_BREW_PREFIX/bin/brew" ]; then
    echo "Homebrew is already installed in $DOTFILES_BREW_PREFIX. Skipping installation."
else
    echo "Homebrew not found. Installing into $DOTFILES_BREW_PREFIX..."

    echo "·${purple} /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\" -- --path $DOTFILES_BREW_PREFIX${reset}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" -- --path "$DOTFILES_BREW_PREFIX"

    echo "Homebrew installation completed."
fi
