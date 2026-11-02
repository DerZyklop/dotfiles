
###-tns-completion-start-###
if [ -f /Users/nils/.tnsrc ]; then
    source /Users/nils/.tnsrc
fi
###-tns-completion-end-###

shopt -s histappend                      # append to history, don't overwrite it


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

# Load Angular CLI autocompletion (only for bash; avoids sh syntax errors).
if [ -n "$BASH_VERSION" ]; then
  # use process substitution supported by bash
  source <(ng completion script)
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
