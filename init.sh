#!/bin/sh

# The script should fail the first time something fails
set -e

echo "⬇${purple} ./init/init.sh${reset}"

echo "${red}"
echo "###############################################"
echo "#        DO NOT RUN THIS SCRIPT BLINDLY       #"
echo "#         YOU'LL PROBABLY REGRET IT...        #"
echo "#                                             #"
echo "#              READ IT THOROUGHLY             #"
echo "#         AND EDIT TO SUIT YOUR NEEDS         #"
echo "###############################################"
echo "${reset}"

# Ask for the administrator password upfront
# echo "·${purple} sudo -v${reset}"

# echo "·${purple} Install NVM${reset}"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.8/install.sh | bash

# Brew is required for the following scripts
if command -v brew >/dev/null 2>&1; then
    echo "Homebrew is already installed. Skipping installation."
else
    echo "Homebrew not found. Installing..."

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "Homebrew installation completed."
fi

### Read the new dotfiles once

echo "·${purple} source ./.exports${reset}"
source ./.exports

for file in $DOTFILESDIR/.{exports,path,completions,bash_prompt,aliases,functions,extra,bashrc}; do
  if [ -r "$file" ] && [ -f "$file" ]; then
    echo "·${purple} source \"$file\"${reset}"
    source "$file";
  fi
done;

read -p "${green}Want to have bash as your default shell?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "·${purple} chsh -s $(which bash) $USER${reset}"
  chsh -s $(which bash) $USER
fi

### Initialize new computer

for f in ./init/*.sh; do
  echo "${green}Want to set $(basename $f .sh)?"
  read -p "Should i? [yN] ${reset}" -n 1 -r
  echo "\nAllright!"
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "·${purple} sh $f${reset}"
    sh $f
  fi
done




read -p "${green}Wanna install sass?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "·${purple} npm install -g sass${reset}"
  npm install -g sass
fi

read -p "${green}Install DerZyklop’s theme?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "·${purple} open $DOTFILESDIR/init/terminaltheme/DerZyklop.terminal${reset}"
  open $DOTFILESDIR/init/terminaltheme/DerZyklop.terminal
fi



read -p "${green}Install SSH key for github (and others)?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "·${purple} mkdir ~/.ssh${reset}"
  mkdir ~/.ssh
  echo "·${purple} cd ~/.ssh${reset}"
  cd ~/.ssh
  echo "·${purple} ssh-keygen${reset}"
  ssh-keygen
  echo "·${purple} echo 'IdentityFile ~/.ssh/github' > ~/.ssh/config${reset}"
  echo 'IdentityFile ~/.ssh/github' > ~/.ssh/config
  echo "·${purple} pbcopy < ~/.ssh/id_rsa.pub${reset}"
  pbcopy < ~/.ssh/id_rsa.pub
  echo "${green}Public key is in clipboard. Paste it here:"
  echo "${blue}https://github.com/settings/ssh${reset}"
  read -p "Press [ENTER] to continue..."
fi


# TODO: Neccessary?
# read -p "${green}Wanna customize the Finder?${reset} [yN] " -n 1 -r
# echo "\nAllright!"
# if [[ $REPLY =~ ^[Yy]$ ]]; then
#   showdotfiles
#   showfinderpath
#   enablefinderquit
# fi

echo "${purple}Your todos now:${reset}"
#echo "${purple}-${reset} Set up Bittorrent Sync \`o ~/Applications/BitTorrent\ Sync.app\`"
echo "${purple}-${reset} run \`https://updates.timingapp.com/download/Timing-2020.7.dmg\` and install it"
echo "${purple}-${reset} run \`brew info --cask little-snitch\`"
echo "${purple}-${reset} In order to restore a backup, open Little Snitch Configuration and choose Rules > Restore from Backup…"
echo "${purple}-${reset} Connect 1Password to your master-file.${reset}"
echo "${purple}-${reset} Set up Dropbox with \`open -a Dropbox\`${reset}"
