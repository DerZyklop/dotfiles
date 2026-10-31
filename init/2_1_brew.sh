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

if command -v brew >/dev/null 2>&1; then
    echo "Homebrew is already installed. Skipping installation."
else
    echo "Homebrew not found. Installing..."

    echo "·${purple} /bin/bash -c \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\"${reset}"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" -- --path /opt/brew

    echo "Homebrew installation completed."
fi
