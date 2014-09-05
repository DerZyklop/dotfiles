# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  echo "$file"
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;











######
###### the cluttered stuff...
######


### SET CONFIG ###

### history handling
# Erase duplicates
export HISTCONTROL=erasedups
# resize history size
export HISTSIZE=10000

# i hate vim
export EDITOR=nano

# get my own commands
export PATH=~/Cloud/server/pxwrk.de/terminal.pxwrk.de/bin:$PATH

# make sure that brew-stuff is used instead of system-stuff
export PATH=/usr/local/bin:$PATH








### THE END ###

# ...and now load .bashrc if it exists
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi