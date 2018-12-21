#!/bin/sh

### Set new dotfiles


read -p "${green}Want to remove all related dotfile-symlinks from your user folder?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  for file in ~/.{exports,path,completions,bash_prompt,aliases,functions,bashrc}; do
    [ -r "$file" ] && [ -f "$file" ] && rm "$file";
  done;
fi

read -p "${green}Want to remove ${red}custom dotfile${green} ».extra« from your user folder?${reset} [yN] " -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  for file in ~/.extra; do
    [ -r "$file" ] && [ -f "$file" ] && rm "$file";
  done;
fi
