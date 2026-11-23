#!/bin/sh

echo "⬇${purple} ./init/dotfile_symlinks.sh${reset}"

DOTFILESDIR="${DOTFILESDIR:-$HOME/.dotfiles}"

for dotfile in \
  .path \
  .completions \
  .bash_prompt \
  .zsh_prompt \
  .aliases \
  .functions \
  .profile \
  .gitignore \
  .exports \
  .jshintrc \
  .gitconfig \
  .bashrc \
  .zshrc \
  .zshenv \
  .zlogin
do
  echo "·${purple} ln -sf $DOTFILESDIR/$dotfile ~/$dotfile${reset}"
  ln -sf "$DOTFILESDIR/$dotfile" "$HOME/$dotfile"
done
# A real ~/.zprofile, e.g. from the Homebrew installer, goes to a backup file first.
if [ -f "$HOME/.zprofile" ] && [ ! -L "$HOME/.zprofile" ]; then
  _backup="$HOME/.zprofile.backup-$(date +%Y%m%d-%H%M%S)"
  echo "·${yellow} mv $HOME/.zprofile $_backup${reset}"
  mv "$HOME/.zprofile" "$_backup"
  unset _backup
fi
echo "·${purple} ln -sf $DOTFILESDIR/.zprofile ~/.zprofile${reset}"
ln -sf "$DOTFILESDIR/.zprofile" ~/.zprofile

echo "·${purple} chmod +x $DOTFILESDIR/bin/${reset}"
chmod +x $DOTFILESDIR/bin/*
