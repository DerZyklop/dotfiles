
###-tns-completion-start-###
if [ -f /Users/nils/.tnsrc ]; then
    source /Users/nils/.tnsrc
fi
###-tns-completion-end-###

shopt -s histappend                      # append to history, don't overwrite it

_BREW_PREFIX="/opt/brew$(id -un)"
case ":$PATH:" in
  *":$_BREW_PREFIX/bin:"*) ;;
  *)
    if [ -x "$_BREW_PREFIX/bin/brew" ]; then
      eval "$("$_BREW_PREFIX/bin/brew" shellenv bash)"
    fi
    ;;
esac
unset _BREW_PREFIX


shell_session_history_check () {
  if [ ${SHELL_SESSION_DID_HISTORY_CHECK:-0} -eq 0 ]; then
    SHELL_SESSION_DID_HISTORY_CHECK=1;
    if shell_session_history_allowed; then
      shell_session_history_enable;
    fi;
    if [ "$PROMPT_COMMAND" = "shell_session_history_check" ]; then
      unset PROMPT_COMMAND;
    else
      if [[ $PROMPT_COMMAND =~ (.*)(; *shell_session_history_check *| *shell_session_history_check *; *)(.*) ]]; then
        PROMPT_COMMAND="${BASH_REMATCH[1]}${BASH_REMATCH[3]}";
      fi;
    fi;
  fi
}

###-tns-completion-start-###
if [ -f /Users/nils/.tnsrc ]; then 
    source /Users/nils/.tnsrc 
fi
###-tns-completion-end-###
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    if ! IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)); then
      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    if ! IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)); then

      local ret=$?
      IFS="$si"
      return $ret
    fi
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###


# Load Angular CLI autocompletion.
# Capture the generated script and only eval it when `ng` produced valid
# output. A broken/missing `ng` can no longer throw a "syntax error near
# unexpected token" that would interrupt shell startup.
_ngcomp="$(ng completion script 2>/dev/null)"
if [ -n "$_ngcomp" ] && bash -n <<<"$_ngcomp" 2>/dev/null; then
  eval "$_ngcomp"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Hermes Agent command
case ":$PATH:" in *":$HOME/.local/bin:"*) ;; *) export PATH="$HOME/.local/bin:$PATH" ;; esac
