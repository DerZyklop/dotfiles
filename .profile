### DerZyklop's .profile ###
### Documentation: https://github.com/DerZyklop/terminal-boilerplate ###


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
        echo "- hoodie"
        echo "––––––––––––––––"
    else
        cd ~/Dropbox/server/pxwrk.dorado.uberspace.de
        if [ "$2" == 'kirby' ]; then
            git clone --recursiv https://github.com/DerZyklop/boilerplate.pxwrk.de.git ./$1.pxwrk.de/
            rm -r assets/sass/sass-boilerplate/demo
            rm -r assets/sass/sass-boilerplate/Gruntfile.coffee
            rm -r assets/sass/sass-boilerplate/package.json
            rm -r assets/sass/sass-boilerplate/README.markdown
            cd $1.pxwrk.de/
            mkdir kirbycms
            git clone https://github.com/bastianallgeier/kirbycms.git kirbycms
            ln -s kirbycms/kirby
            cp kirbycms/index.php index.php
            cp -r kirbycms/content content
            cp -r kirbycms/site site
            ln -s kirbycms/.htaccess
        elif [ "$2" == 'hoodie' ]; then
            hoodie new $1.pxwrk.de
            cd $1.pxwrk.de/
            git clone --recursiv https://github.com/DerZyklop/boilerplate.pxwrk.de.git ./temp_www/
            cp -r temp_www/ www/
            rm temp_www/
            cd www/
            rm -r assets/sass/sass-boilerplate/demo
            rm -r assets/sass/sass-boilerplate/Gruntfile.coffee
            rm -r assets/sass/sass-boilerplate/package.json
            rm -r assets/sass/sass-boilerplate/README.markdown
            hoodie start
        fi
        echo -e '
{
  "name": "'$1'.pxwrk.de",
  "description": "Project by @DerZyklop",
  "version": "0.0.1",
  "private": true,
  "devDependencies": {
    "grunt": "0.4.x",
    "matchdep": "0.1.x",
    "grunt-open": "0.2.x",
    "grunt-contrib-watch": "0.5.x",
    "grunt-contrib-coffee": "0.7.x",
    "grunt-contrib-sass": "0.4.x",
    "grunt-contrib-uglify": "0.2.x",
    "grunt-contrib-copy": "0.4.x",
    "grunt-php": "0.2.x",
    "grunt-contrib-cssmin": "0.6.x",
    "grunt-autoprefixer": "0.6.x"
  },
  "scripts": {
    "start": "grunt server",
    "watch": "grunt watch"
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

## Searches if the requested project is located in Dropbox or ownCloud
function navToDevPath() {
  if [ -d ~/Dropbox/server/$1 ]; then
    cd ~/Dropbox/server/$1
  elif [ -d ~/ownCloud/dev/$1 ]; then
    cd ~/ownCloud/dev/$1
  else
    echo "Error: Project not found!"
  fi
}

## pxwrk.de folder
function p() {
  if [ $# -gt 1 ]; then
    echo "USAGE: p projectname"
    echo "Maximum one param!"
  elif [ $# -lt 1 ]; then
    echo "USAGE: p projectname"
    echo "Minimum one param!"
  else
    navToDevPath pxwrk.dorado.uberspace.de/$1.pxwrk.de
  fi
}

## pxwrk.de server
alias puber="ssh pxwrk@dorado.uberspace.de"

## Navigates to GitHub folder or sub if param
function g() {
  if [ $# -gt 1 ]; then
    echo "USAGE: g projectname"
    echo "Maximum one param!"
  elif [ $# -lt 1 ]; then
    echo "USAGE: g projectname"
    echo "Minimum one param!"
  else
    navToDevPath github-derzyklop/$1
  fi
}

# Opens my personal Terminal configuration
function profile() {
  if [ -f ~/.bashrc ]; then
    subl ~/.bashrc
  fi
  subl ~/Dropbox/server/github-derzyklop/terminal-boilerplate/.profile
}


### THE END ###


# ...and now load .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
