### How to install ###

# Create a symlink to the Cloud:
# # cd ~
# # ln -s /PATH_TO_THE_CLOUD/library/Terminal/.profile .profile


### Tools that should be set up on a zyklop-machine ###

# # brew update

# # brew install git
# # git config --global color.ui true
# # git config --global user.name "Nils Neumann"
# # git config --global user.email mail@der-zyklop.de
# more git-stuff here:
# http://git-scm.com/book/en/Customizing-Git-Git-Configuration

# # brew install node
# # npm install -g grunt-cli


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


### COMMAND-SHORTCUTS ###

# Check reboot times
alias re="last reboot"
# Clear up the terminal window
alias c="clear"
# get all ports
alias ports="sudo lsof -i -P | grep -i LISTEN"
# open stuff with Sublime Text 2
alias subl="/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl"
function s() {
  if [ $# -lt 1 ]; then
    subl .
  else
    subl $1
  fi
}

# Opens current git-project on github.com
function gh() {
  open $(git config --get remote.origin.url)
}
# Some other often-used git stuff
alias "gs"="git status"
alias "gd"="git diff "
alias "ga"="git add"
alias "gc"="git commit -m "
alias "gp"="git push"
function gi() {
  git init
  touch README.md
  touch .gitignore
  echo -e ".gitignore\n.DS_Store"> .gitignore
}



### NEW COMMANDS ###

# Set Finder label color
function label() {
  if [ $# -lt 2 ]; then
    echo "USAGE: label [0-7] file1 [file2] ..."
    echo "Sets the Finder label (color) for files"
    echo "Default colors:"
    echo " 0  No color"
    echo " 1  Orange"
    echo " 2  Red"
    echo " 3  Yellow"
    echo " 4  Blue"
    echo " 5  Purple"
    echo " 6  Green"
    echo " 7  Gray"
  else
    osascript - "$@" << EOF
    on run argv
        set labelIndex to (item 1 of argv as number)
        repeat with i from 2 to (count of argv)
          tell application "Finder"
              set theFile to POSIX file (item i of argv) as alias
              set label index of theFile to labelIndex
          end tell
        end repeat
    end run
EOF
  fi
}

# Create a new project
function create() {
    if [ $# -lt 2 ]; then
        echo "––––––––––––––––"
        echo "USAGE: create projectname [projecttype]"
        echo "Creates a new Project in pxwrk.de"
        echo "Possible project types:"
        echo "- html"
        echo "- kirby"
        echo "––––––––––––––––"
    else
        cd ~/Dropbox/server/pxwrk.dorado.uberspace.de
        git clone --recursiv https://github.com/DerZyklop/boilerplate.pxwrk.de.git ./$1.pxwrk.de/
        rm -r assets/sass/sass-boilerplate/demo
        rm -r assets/sass/sass-boilerplate/Gruntfile.coffee
        rm -r assets/sass/sass-boilerplate/package.json
        rm -r assets/sass/sass-boilerplate/README.markdown
        cd $1.pxwrk.de/
        if [ "$2" == 'kirby' ]; then
            mkdir kirbycms
            git clone https://github.com/bastianallgeier/kirbycms.git kirbycms
            ln -s kirbycms/kirby
            cp kirbycms/index.php index.php
            cp -r kirbycms/content content
            cp -r kirbycms/site site
            ln -s kirbycms/.htaccess
        fi
        echo -e '
{
  "name": "'$1'.pxwrk.de",
  "description": "Project by @DerZyklop",
  "version": "0.0.1",
  "private": true,
  "devDependencies": {
    "grunt": "~0.4.1",
    "matchdep": "~0.1.2",
    "grunt-open": "~0.2.2",
    "grunt-contrib-watch": "~0.5.2",
    "grunt-contrib-coffee": "~0.7.0",
    "grunt-contrib-sass": "~0.4.1",
    "grunt-contrib-uglify": "~0.2.2",
    "grunt-contrib-copy": "~0.4.1",
    "grunt-php": "~0.2.0",
    "grunt-contrib-cssmin": "~0.6.2"
  }
}' > ~/Dropbox/server/pxwrk.dorado.uberspace.de/$1.pxwrk.de/package.json
        label 2 .
        npm install
        subl .
    fi
}


### IMPROVEMENTS ###

# Put stuff into trash instead of delete them
function rm () {
  local path
  for path in "$@"; do
    # ignore any arguments
    if [[ "$path" = -* ]]; then :
    else
      local dst=${path##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst "$(date +%H-%M-%S)
      done
      mv "$path" ~/.Trash/"$dst"
    fi
  done
}


### NAVIGATION ###

# Open current folder
alias o="open ."

## PlaceWorkers folder
alias pw="cd ~/Dropbox/server/placeworkers_ftp/placeworkers.com/"

## der-zyklop.de folder
alias z="cd ~/Dropbox/server/github-derzyklop/der-zyklop.de"
## der-zyklop.de server
alias zuber="ssh zyklop@pisces.uberspace.de"

## pxwrk.de folder
function p() {
  cd ~/Dropbox/server/pxwrk.dorado.uberspace.de/
  if [ $# -gt 1 ]; then
    echo "USAGE: p projectname"
    echo "Just one param!"
  fi

  if [ $# -gt 0 ]; then
    cd $1.pxwrk.de
  # else
    # cd html
  fi
}
## pxwrk.de server
alias puber="ssh pxwrk@dorado.uberspace.de"

## Navigates to GitHub folder or sub if param
function g() {
  cd ~/Dropbox/server/github-derzyklop/
  if [ $# -gt 1 ]; then
    echo "USAGE: p projectname"
    echo "Just one param!"
  fi
  if [ $# -gt 0 ]; then
    cd $1
  fi
}

# Opens my personal Terminal configuration
function profile() {
  if [ -f ~/.bashrc ]; then
    subl ~/.bashrc
  fi
  subl ~/Dropbox/library/Terminal/.profile
}


### THE END ###


# and now load .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi






### Colors Overview ###

# export PS1='
# \[\033[02;30m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[02;31m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[02;32m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[02;33m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[02;34m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[02;35m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[02;36m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[02;37m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[01;30m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[01;31m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[01;32m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[01;33m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[01;34m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[01;35m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[01;36m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[01;37m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[00;30m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[00;31m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[00;32m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[00;33m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[00;34m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[00;35m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[00;36m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# \[\033[00;37m\]–––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––-
# '
