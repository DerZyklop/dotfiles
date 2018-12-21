#!/bin/sh

echo "⬇${purple} ./init/initnode.sh${reset}"
if ! commandExists "npm"; then
  echo "·${purple} brew install node${reset}"
  brew install node
fi


echo "·${purple} npm update -g npm${reset}"
npm update -g npm

node_packages=(
  # grunt
  # grunt-cli
  prompt
  jshint
  # cool-ascii-faces
)

echo "·${purple} npm install -g ${node_packages[@]}${reset}"
npm install -g ${node_packages[@]}
