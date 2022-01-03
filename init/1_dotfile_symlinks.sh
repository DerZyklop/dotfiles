#!/bin/sh

echo "⬇${purple} ./init/dotfile_symlinks.sh${reset}"

echo "·${purple} ln -sf $DOTFILESDIR/.path $HOME${reset}"
ln -sf $DOTFILESDIR/.path $HOME
echo "·${purple} ln -sf $DOTFILESDIR/.completions $HOME${reset}"
ln -sf $DOTFILESDIR/.completions $HOME
echo "·${purple} ln -sf $DOTFILESDIR/.bash_prompt $HOME${reset}"
ln -sf $DOTFILESDIR/.bash_prompt $HOME
echo "·${purple} ln -sf $DOTFILESDIR/.aliases $HOME${reset}"
ln -sf $DOTFILESDIR/.aliases $HOME
echo "·${purple} ln -sf $DOTFILESDIR/.functions $HOME${reset}"
ln -sf $DOTFILESDIR/.functions $HOME
echo "·${purple} ln -sf $DOTFILESDIR/.profile $HOME${reset}"
ln -sf $DOTFILESDIR/.profile $HOME
echo "·${purple} ln -sf $DOTFILESDIR/.gitignore $HOME${reset}"
ln -sf $DOTFILESDIR/.gitignore $HOME
echo "·${purple} ln -sf $DOTFILESDIR/.exports $HOME${reset}"
ln -sf $DOTFILESDIR/.exports $HOME
echo "·${purple} ln -sf $DOTFILESDIR/.jshintrc $HOME${reset}"
ln -sf $DOTFILESDIR/.jshintrc $HOME
echo "·${purple} ln -sf $DOTFILESDIR/.gitconfig $HOME${reset}"
ln -sf $DOTFILESDIR/.gitconfig $HOME
echo "·${purple} ln -sf $DOTFILESDIR/.bashrc $HOME${reset}"
ln -sf $DOTFILESDIR/.bashrc $HOME
echo "·${purple} ln -sf $DOTFILESDIR/.zshrc $HOME${reset}"
ln -sf $DOTFILESDIR/.zshrc $HOME

echo "·${purple} chmod +x $DOTFILESDIR/bin/${reset}"
chmod +x $DOTFILESDIR/bin/*
