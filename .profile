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

# get my own commands
export PATH=~/Cloud/server/pxwrk.de/terminal.pxwrk.de/bin/:$PATH

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


# open stuff with Sublime Text
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

function s() {
  if [ $# -lt 1 ]; then
    subl .
  else
    subl $1
  fi
}

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



### NEW COMMANDS ###

# Set Finder label color
function label() {
  if [ $# -lt 2 ]; then
    echo "USAGE: label [0-7] file1 [file2] ..."
    echo "Sets the Finder label (color) for files"
    echo "Default colors:"
    tput setaf 0
    echo " 0  No color"
    tput setaf 9
    echo " 1  Orange"
    tput setaf 1
    echo " 2  Red"
    tput setaf 3
    echo " 3  Yellow"
    tput setaf 6
    echo " 4  Blue"
    tput setaf 4
    echo " 5  Purple"
    tput setaf 2
    echo " 6  Green"
    tput setaf 8
    echo " 7  Gray"
    tput sgr0
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

# install submodules
function sub() {

  function addModule() {

    if [ -d "submodules/$2/" ]; then
      echo 'Gonna update it...'
      NEW=false
    else
      echo 'Gonna install it...'
      NEW=true
    fi


    if [ "$NEW" == true ]; then
      mkdir submodules
      cd submodules
    else
      cd submodules
      rm -rf $2
    fi

    git clone https://github.com/$1/$2.git
    cd ..
    ga submodules/$2/

    if [ "$NEW" == true ]; then
      gc "added $2 by $1 to Submodules"
      tput setaf 2
      echo "-----------––----------------––--------------"
      echo "Added $2 by $1 to Submodules!"
      echo "-----------––----------------––--------------"
      tput sgr0
    else
      gc "Updated submodule $2 by $1"
      tput setaf 2
      echo "-----------––--------------––--------------"
      echo "Updated submodule $2 by $1!"
      echo "-----------––--------------––--------------"
      tput sgr0
    fi
  }

  if [ $# -lt 1 ]; then
    echo "––––––––––––––––-------"
    echo "USAGE: sub [modulename]"
    echo "––––––––––––––––-------"
  elif [ "$1" == 'boilerplate' ]; then
    addModule DerZyklop boilerplate.pxwrk.de
    cp -Ri ./submodules/boilerplate.pxwrk.de/ ./
    npm install
    rm README.md
    #cp -r submodules/boilerplate/gruntfile.coffee ./gruntfile.coffee
    #echo "–––––––– Installed $1! –-------"
  elif [ "$1" == 'panel' ]; then
    addModule bastianallgeier kirbycms-panel
    cp -r submodules/kirbycms-panel/ ./panel
    mv panel/defaults/ ./site/panel
    echo "–––––––– Installed $1! –-------"
  elif [ "$1" == 'kirby' ]; then
    addModule bastianallgeier kirbycms
    cp -r submodules/kirbycms/kirby ./kirby
    cp submodules/kirbycms/index.php index.php
    cp -r submodules/kirbycms/content content
    cp -r submodules/kirbycms/site site
    cp submodules/kirbycms/.htaccess .htaccess
    echo "–––––––– Installed $1! –-------"
  elif [ "$1" == 'thumbs' ]; then
    addModule bastianallgeier kirbycms-extensions
    cp submodules/kirbycms-extensions/plugins/thumb/thumb.php site/plugins/
    mkdir thumbs
    echo "–––––––– Installed $1! –-------"
  elif [ $# == 2 ]; then
    addModule $1 $2
  else
    tput setaf 1
    echo "--------------------––-------"
    echo "Sorry! Can't find that Module"
    echo "--------------------––-------"
    tput sgr0
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
        cd ~/Cloud/server/pxwrk.de
        if [ "$2" == 'kirby' ]; then
            git clone --recursiv https://github.com/DerZyklop/boilerplate.pxwrk.de.git ./$1.pxwrk.de/submodules/boilerplate
            cd $1.pxwrk.de/
            cp -r submodules/boilerplate/ ./
            rm -r .git
            rm -r .gitignore
            rm -r .gitmodules
            rm -r assets/sass/sass-boilerplate/demo
            rm -r assets/sass/sass-boilerplate/Gruntfile.coffee
            rm -r assets/sass/sass-boilerplate/package.json
            rm -r assets/sass/sass-boilerplate/README.markdown

            sub kirby
            sub panel
            sub thumbs

        elif [ "$2" == 'wordpress' ]; then
            curl -o wordpress-2.6.1.tar.gz http://wordpress.org/latest.tar.gz
            tar -xzvf wordpress-2.6.1.tar.gz
            rm wordpress-2.6.1.tar.gz
            mv wordpress/ $1.pxwrk.de/
            cd $1.pxwrk.de/
        elif [ "$2" == 'hoodie' ]; then
            hoodie new $1.pxwrk.de
            cd $1.pxwrk.de/
            git clone --recursiv https://github.com/DerZyklop/boilerplate.pxwrk.de.git ./temp_www/
            mv temp_www/ www/
            cd www/
            rm -r assets/sass/sass-boilerplate/demo
            rm -r assets/sass/sass-boilerplate/Gruntfile.coffee
            rm -r assets/sass/sass-boilerplate/package.json
            rm -r assets/sass/sass-boilerplate/README.markdown
            hoodie start
        fi
        label 2 .
        npm install
        gi
        subl .
    fi
}


### NAVIGATION ###

# Open current folder
alias o="open ."

## der-zyklop.de server
alias zuber="ssh zyklop@pisces.uberspace.de"

## Searches if the requested project is located in Dropbox or ownCloud
function navToDevPath() {
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

  # elif [ -d ~/ownCloud/dev/pxwrk.de/$1.pxwrk.de ]; then
  #   cd ~/ownCloud/dev/pxwrk.de/$1.pxwrk.de
  # elif [ -d ~/ownCloud/dev/github-derzyklop/$1 ]; then
  #   cd ~/ownCloud/dev/github-derzyklop/$1
  # elif [ -d ~/ownCloud/dev/pxwrk.de/git.pxwrk.de/$1 ]; then
  #   cd ~/ownCloud/dev/pxwrk.de/git.pxwrk.de/$1
  # elif [ -d ~/ownCloud/dev/$1 ]; then
  #   cd ~/ownCloud/dev/$1

  else
    tput setaf 1
    echo "-------------------------"
    echo "Error: Project not found!"
    echo "-------------------------"
    tput sgr0
  fi
}

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
    navToDevPath $1
  fi
}

function start() {
  if [ -f boilerplate.json ]; then
    grunt dev
  elif [ -f gruntfile.coffee ]; then
    grunt server
  else
    tput setaf 1
    echo "--------------------------------------"
    echo "Error: Is this a Project with Grunt???"
    echo "--------------------------------------"
    tput sgr0
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


# Opens my personal Terminal configuration
function profile() {
  if [ -f ~/.bashrc ]; then
    subl ~/.bashrc
  fi
  navToDevPath terminal
  subl .profile
}


### THE END ###

# ...and now load .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
