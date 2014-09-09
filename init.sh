#!/bin/sh

### Set new dotfiles

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DOTFILESDIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

echo "${green}Want to install the new dotfiles?"
echo "${red}Attention: This will overwrite your current dotfiles!"
read -p "${green}Should i?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  ln -sf $DOTFILESDIR/.path ~
  ln -sf $DOTFILESDIR/.bash_prompt ~
  ln -sf $DOTFILESDIR/.aliases ~
  ln -sf $DOTFILESDIR/.functions ~
  ln -sf $DOTFILESDIR/.profile ~
  ln -sf $DOTFILESDIR/.gitignore ~
  ln -sf $DOTFILESDIR/.exports ~
fi

read -p "${green}Want to have bash as your default shell?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  chsh -s $(which bash) $USER
fi

read -p "${green}Wanna install commands via brew?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  sh $DOTFILESDIR/init/initbrew.sh
fi

read -p "${green}Wanna install software via brewcask?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  sh $DOTFILESDIR/init/initbrewcask.sh
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

### Grunt

read -p "${green}Wanna install grunt-cli?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  npm install -g grunt-cli
fi

### Fonts
cp -r $DOTFILESDIR/init/submodules/fira/ttf/ /Library/Fonts/
open $DOTFILESDIR/init/DerZyklop.terminal
