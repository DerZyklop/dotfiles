#!/bin/sh

### Set new dotfiles

for file in ~/.{path,exports,bash_prompt,aliases,functions,extra,bashrc}; do
  [ -r "$file" ] && [ -f "$file" ] && rm "$file";
done;
