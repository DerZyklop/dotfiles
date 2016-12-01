# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $HOME/.{exports,path,completions,aliases,bash_prompt,functions,extra,bashrc}; do
  if [ ! -f "$file" ] && [ ! "$file" = "$HOME/.extra" ] && [ ! "$file" = "$HOME/.bashrc" ]; then
    echo "${red}Expected file $file doesn't exist!${reset}"
  fi
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Add tab completion for many Bash commands
if commandExists "brew" && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
  source /etc/bash_completion;
fi;
