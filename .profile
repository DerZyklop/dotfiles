### DerZyklop's .profile ###


### SET CONFIG ###

# Show some butiful colors
export PS1='\[\033[02;30m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
\[\033[02;30m\]# \[\033[02;30m\]\u \[\033[02;30m\]@ \[\033[02;30m\]\H \[\033[02;36m\]\W
\[\033[02;30m\]$ \[\033[00m\]'

# Cli Colors
export CLICOLOR=1

# use yellow for dir’s
export LSCOLORS=dxfxcxdxbxegedabagacad

### history handling
# Erase duplicates
export HISTCONTROL=erasedups
# resize history size
export HISTSIZE=10000
# append to bash_history if Terminal.app quits
shopt -s histappend

# make sure to take php5
export PATH=/usr/local/php5/bin:$PATH

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
alias "gl"="git log --oneline"

function gp() {
  if [ $# -gt 1 ]; then
    echo "USAGE: gp [commit-msg]"
    tput setaf 1
    echo "Maximum one param!"
    tput sgr0
  elif [ $# -lt 1 ]; then
    git push
  else
    git commit -m $1
    git push
  fi
}

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

## ssh
alias zuber="ssh zyklop@der-zyklop.de"
alias puber="ssh pxwrk@pxwrk.de"
alias buber="ssh betti@unisono-giessen.de"

# get my own commands
export PATH=~/Cloud/server/pxwrk.de/terminal.pxwrk.de/bin/:$PATH

# Add RVM to PATH for node-scripting
export PATH="$PATH:$HOME/.rvm/bin"

### THE END ###

# ...and now load .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
