#!/bin/sh

### Set new dotfiles

for file in ~/.{exports,path,completions,bash_prompt,aliases,functions,extra,bashrc}; do
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

read -p "${green}Wanna install commands via brew?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  source $DOTFILESDIR/init/initbrew.sh
fi

mkdir ~/todo
cp /usr/local/Cellar/todo-txt/2.10/todo.cfg $HOME/todo


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

#### Setup git-stuff
if [ -f ~/.gitignore ]; then
   git config --global core.excludesfile ~/.gitignore
fi
# For more usefull git-stuff see <http://git-scm.com/book/en/Customizing-Git-Git-Configuration>

open $DOTFILESDIR/init/DerZyklop.terminal
