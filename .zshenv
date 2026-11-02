# zsh runs this file for every shell, also for scripts and `zsh -c`.
# .zshrc runs only for interactive shells, so the secrets in ~/.extra are loaded here.
[ -r ~/.extra ] && source ~/.extra
