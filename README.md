# Terminal

These are my personal terminal settings.

I wouldn't recommend to use it as it is for your project. It's not documented.
It's just a collection files and configurations, that i use in my projects.


## How to install

Place the .profile into your cloud-folder e.g. ownCloud or Dropbox.
Create a symlink to the Cloud:

```
cd ~
cd ~/PATH_TO_THE_CLOUD/
git clone https://github.com/DerZyklop/terminal-boilerplate.git
ln -s ~/PATH_TO_THE_CLOUD/terminal-boilerplate/.profile ~/.profile
ln -s ~/PATH_TO_THE_CLOUD/terminal-boilerplate/.zshrc ~/.zshrc
```

## Tools that should be set up on a zyklop-machine

mysql

```
bash <(curl -Ls http://git.io/eUx7rg)
```

show hidden files in finder

```
defaults write com.apple.finder AppleShowAllFiles TRUE
```

### Zsh

```
brew install zsh
chsh -s /usr/bin/zsh username
```

### Git

```
brew update

brew install git
git config --global color.ui true
git config --global user.name "Nils Neumann"
git config --global user.email mail@der-zyklop.de
git config --global format.pretty oneline
```

More usefull git-stuff at <http://git-scm.com/book/en/Customizing-Git-Git-Configuration>

### Grunt

```
brew install node
npm install -g grunt-cli
```

## Colors Overview

To see all available colors in the terminal, try this:

```
export PS1='
\[\033[02;30m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[02;31m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[02;32m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[02;33m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[02;34m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[02;35m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[02;36m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[02;37m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[01;30m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[01;31m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[01;32m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[01;33m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[01;34m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[01;35m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[01;36m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[01;37m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[00;30m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[00;31m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[00;32m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[00;33m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[00;34m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[00;35m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[00;36m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[00;37m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-'
```
