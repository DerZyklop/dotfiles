# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,exports,bash_prompt,aliases,functions,extra,bashrc}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

function commandExists() {
  if ! foobar_loc="$(type -p "$1")" || [ -z "$foobar_loc" ]; then
    return 1
  else
    return 0
  fi
}

# Add tab completion for many Bash commands
if commandExists "brew" && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;
