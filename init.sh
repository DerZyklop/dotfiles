#!/bin/sh

### Set new dotfiles

for file in ~/.{path,exports,bash_prompt,aliases,functions,extra,bashrc}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

echo "${green}Want to install the new dotfiles?"
echo "${red}Attention: This will overwrite your current dotfiles!"
read -p "${green}Should i?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  sh $DOTFILESDIR/init/initsymlinks.sh
fi

read -p "${green}Want to have bash as your default shell?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  chsh -s $(which bash) $USER
fi

read -p "${green}Wanna install commands via brew?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  source $DOTFILESDIR/init/initbrew.sh
fi

read -p "${green}Wanna install software via brewcask?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  source $DOTFILESDIR/init/initbrewcask.sh
fi

read -p "${green}Wanna install some good fonts?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  source $DOTFILESDIR/init/initbrewcaskfonts.sh
fi

read -p "${green}Wanna install some node globals?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  source $DOTFILESDIR/init/initnode.sh
fi

read -p "${red}Want to set git-user to DerZyklop?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  git config --global user.name "DerZyklop"
  git config --global user.email mail@der-zyklop.de
fi

#### Setup git-stuff
git config --global color.ui true
git config --global format.pretty oneline
git config --global push.default simple
# ...and now load .bashrc if it exists
if [ -f ~/.gitignore ]; then
   git config --global core.excludesfile ~/.gitignore
fi
# For more usefull git-stuff see <http://git-scm.com/book/en/Customizing-Git-Git-Configuration>

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

# For more usefull git-stuff see <http://git-scm.com/book/en/Customizing-Git-Git-Configuration>

open $DOTFILESDIR/init/DerZyklop.terminal
