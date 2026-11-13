#!/bin/sh

## If brew gives a 'permission denied':
## chown $(whoami):admin /Library/Caches/Homebrew/Formula/

echo "⬇${purple} ./init/2_1_brew.sh${reset}"

BREW_PREFIX="/opt/brew$(id -un)"

### Read the new dotfiles once
for file in $DOTFILESDIR/.{exports,path,completions,bash_prompt,aliases,functions,extra,bashrc}; do
  if [ -r "$file" ] && [ -f "$file" ]; then
    echo "·${purple} source \"$file\"${reset}"
    source "$file";
  fi
done;

if [ -x "$BREW_PREFIX/bin/brew" ]; then
    echo "Homebrew is already installed. Skipping installation."
else
    echo "Homebrew not found. Installing..."

    echo "·${purple} /bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\" -- --path $BREW_PREFIX${reset}"
    if ! /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" -- --path "$BREW_PREFIX"; then
        echo "Homebrew installation failed for $BREW_PREFIX." >&2
        exit 1
    fi

    if [ ! -x "$BREW_PREFIX/bin/brew" ]; then
        echo "Homebrew installer finished, but $BREW_PREFIX/bin/brew was not created." >&2
        exit 1
    fi

    echo "Homebrew installation completed."
    echo "To use brew in this terminal, run: eval \"\$($BREW_PREFIX/bin/brew shellenv bash)\""
fi
