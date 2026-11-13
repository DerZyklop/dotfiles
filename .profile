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
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      if [ "${BASH_VERSINFO[0]:-0}" -lt 4 ] ||
         { [ "${BASH_VERSINFO[0]:-0}" -eq 4 ] && [ "${BASH_VERSINFO[1]:-0}" -lt 4 ]; }; then
        if grep -Eq 'complete[[:space:]].*-o[[:space:]]+nosort([[:space:]]|$)' "$COMPLETION"; then
          continue
        fi
      fi
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --path)"
fi

# sometimes these rights get lost in our Plano app.
if [ -d "$HOME/S/plano/git/hooks" ]; then
  chmod -R +x "$HOME/S/plano/git/hooks/"
fi

# Hermes Agent command
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac
