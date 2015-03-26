#!/bin/sh

if ! commandExists "npm"; then
  brew install node
fi

npm update -g npm

node_packages=(
  grunt
  grunt-cli
  prompt
  jshint
  cool-ascii-faces
)

echo "installing ${purple}node_packages${reset}"
npm install -g ${node_packages[@]}
