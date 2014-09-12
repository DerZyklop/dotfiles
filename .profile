# Load the shell dotfiles, and then some:
# * ~/.extra can be used for other settings you don’t want to commit.
for file in $HOME/.{exports,path,completions,bash_prompt,aliases,functions,extra,bashrc}; do
  if [ ! -f "$file" ] && [ ! "$file" = "$HOME/.extra" ] && [ ! "$file" = "$HOME/.bashrc" ]; then
    echo "${red}$file doesn't exist!${reset}"
    echo "${reset}You sure you did the sh init?!${reset}"
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
