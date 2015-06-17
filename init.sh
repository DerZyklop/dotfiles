#!/bin/sh



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
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


### Read the new dotfiles once

source ./.exports
for file in $DOTFILESDIR/.{exports,path,completions,bash_prompt,aliases,functions,extra,bashrc}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;



read -p "${green}Want to have bash as your default shell?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  chsh -s $(which bash) $USER
fi

read -p "${green}Wanna install XCode Command Line Tools?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  # XCode Command Line Tools
  if [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; then
    xcode-select --install &> /dev/null

    # Wait until the XCode Command Line Tools are installed
    while [ $(xcode-select -p &> /dev/null; printf $?) -ne 0 ]; do
        sleep 5
    done
  fi
fi

### Initialize new computer

for f in ./init/*.sh; do
  echo "${green}Want to set preferences for $(basename $f .sh)?"
  read -p "Should i? [yN] ${reset}" -n 1 -r
  echo "\nAllright!"
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    sh $f
  fi
done




read -p "${green}Wanna install sass?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  sudo gem install sass
fi

read -p "${green}Should i install 1Password?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  $(cd ~/Downloads/;wget https://d13itkw33a7sus.cloudfront.net/dist/1P/mac4/1Password-5.1.zip;unzip 1Password-5.1.zip -d /Applications;rm ~/Downloads/1Password-5.1.zip;
  open /Applications/1Password\ 5.app
  echo "${green}Connect 1Password to your master-file.${reset}"
  read -p "Press [ENTER] to continue..."

fi

read -p "${green}Install DerZyklop’s theme?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  open $DOTFILESDIR/init/terminaltheme/DerZyklop.terminal
fi



read -p "${green}Install SSH key for github (and others)?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  mkdir ~/.ssh
  cd ~/.ssh
  ssh-keygen
  echo 'IdentityFile ~/.ssh/github' > ~/.ssh/config
  pbcopy < ~/.ssh/github.pub
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
echo "${purple}-${reset} Set up Bittorrent Sync \`o ~/Applications/BitTorrent\ Sync.app\`"
echo "${purple}-${reset} run \`brew cask info little-snitch\`"
echo "${purple}-${reset} run \`brew cask info default-folder-x\`"
