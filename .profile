# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  #echo "$file"
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;



######
###### the cluttered stuff...
######


# # enable programmable completion features (you don't need to enable
# # this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# # sources /etc/bash.bashrc).

function commandExists() {
  if ! foobar_loc="$(type -p "$1")" || [ -z "$foobar_loc" ]; then
    return 1
  else
    return 0
  fi
}

if commandExists "brew"; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
  fi
fi


### SET CONFIG ###

### history handling
# Erase duplicates
export HISTCONTROL=erasedups
# resize history size
export HISTSIZE=10000

# get my own commands
export PATH=$DOTFILESDIR/bin:$PATH

# Make Sublime the default editor
export EDITOR="nano"

# make sure that brew-stuff is used instead of system-stuff
export PATH=/usr/local/bin:$PATH



### THE END ###

# ...and now load .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
