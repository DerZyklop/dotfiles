# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/nils/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install





### DerZyklop's .profile ###


### SET CONFIG ###

autoload -U colors && colors
PS1="%{$fg[black]%}–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
%{$fg[black]%}%n @ %M %{$fg_no_bold[cyan]%}%~
%{$fg[black]%}$ %{$reset_color%}%{$fg[bg-cyan]%}"

# Cli Colors
export CLICOLOR=1

# use yellow for dir’s
export LSCOLORS=dxfxcxdxbxegedabagacad

### history handling
# Erase duplicates
export HISTCONTROL=erasedups
# resize history size
export HISTSIZE=10000

# i hate vim
export EDITOR=nano

### COMMAND-SHORTCUTS ###

# ls mit versteckten dateien und slashes an ordnern
alias ls="ls -pa"
# Check reboot times
alias re="last reboot"
# Clear up the terminal window
alias c="clear"
# get all ports
alias ports="sudo lsof -i -P | grep -i LISTEN"
# change owner to current user
alias access="sudo chown -R $USER "
# get all processes
alias processes="lsof -i TCP"


# Opens current git-project on github.com
function gopen() {
  open $(git config --get remote.origin.url)
}
# Some other often-used git stuff
alias "gs"="git status"
alias "gd"="git diff "
alias "ga"="git add -A"
alias "gc"="git commit -m "
alias "gp"="git push"
alias "gl"="git log --oneline"

function gi() {
  git init
  touch README.md
  touch .gitignore
  echo -e ".gitignore\n.DS_Store"> .gitignore
}


### NAVIGATION ###

# Open current folder
alias o="open ."

## der-zyklop.de server
alias zuber="ssh zyklop@pisces.uberspace.de"

## pxwrk.de folder
function p() {
  if [ $# -gt 1 ]; then
    echo "USAGE: p projectname"
    tput setaf 1
    echo "Maximum one param!"
    tput sgr0
  elif [ $# -lt 1 ]; then
    echo "USAGE: p projectname"
    tput setaf 1
    echo "Minimum one param!"
    tput sgr0
  else
    navtodevpath $1
  fi
}

## pxwrk.de server
function puber() {
  if [ "$1" == '-f' ]; then
    ssh pxwrk@pxwrk.de -o PubkeyAuthentication=no
  else
    ssh pxwrk@pxwrk.de
  fi
}

## Searches if the requested project is located in Dropbox or ownCloud
function navtodevpath() {

  if [ -d ~/Dropbox/server/pxwrk.de/$1.pxwrk.de ]; then
    cd ~/Dropbox/server/pxwrk.de/$1.pxwrk.de
  elif [ -d ~/Dropbox/server/github-derzyklop/$1 ]; then
    cd ~/Dropbox/server/github-derzyklop/$1
  elif [ -d ~/Dropbox/server/pxwrk.de/git.pxwrk.de/$1 ]; then
    cd ~/Dropbox/server/pxwrk.de/git.pxwrk.de/$1
  elif [ -d ~/Dropbox/server/$1 ]; then
    cd ~/Dropbox/server/$1

  elif [ -d ~/Cloud/server/pxwrk.de/$1.pxwrk.de ]; then
    cd ~/Cloud/server/pxwrk.de/$1.pxwrk.de
  elif [ -d ~/Cloud/server/github-derzyklop/$1 ]; then
    cd ~/Cloud/server/github-derzyklop/$1
  elif [ -d ~/Cloud/server/pxwrk.de/git.pxwrk.de/$1 ]; then
    cd ~/Cloud/server/pxwrk.de/git.pxwrk.de/$1
  elif [ -d ~/Cloud/server/$1 ]; then
    cd ~/Cloud/server/$1

  else
    tput setaf 1
    echo "-------------------------"
    echo "Error: Project not found!"
    echo "-------------------------"
    tput sgr0
  fi

}

# get my own commands
export PATH=~/Cloud/server/pxwrk.de/terminal.pxwrk.de/bin:$PATH

# make sure that brew-stuff is used instead of system-stuff
export PATH=/usr/local/bin:$PATH

### THE END ###

# ...and now load .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
