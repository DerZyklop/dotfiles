# zsh runs this file for login shells, after .zshrc.
# .zshrc loads the shared dotfiles. .profile is for bash only.

# sometimes these rights get lost in our Plano app.
if [ -d "$HOME/S/plano/git/hooks" ]; then
  chmod -R +x "$HOME/S/plano/git/hooks/"
fi
