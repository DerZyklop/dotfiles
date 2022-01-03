#!/bin/sh

echo "⬇${purple} ./init/initnode.sh${reset}"
if ! commandExists "npm"; then
  echo "·${purple} brew install node${reset}"
  brew install node
fi

read -p "${green}Should i install nvm? [yN] ${reset}" -n 1 -r
echo "\nAllright!"
if [[ $REPLY =~ ^[Yy]$ ]]; then
  echo "·${purple} curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash $f${reset}"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

  # Load nvm to the current shell to be able to use it in following init.sh code
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
fi

echo "·${purple} npm update -g npm${reset}"
npm update -g npm

node_packages=(
  # grunt
  # grunt-cli
  prompt
  jshint
  # cool-ascii-faces
  npm-check-updates
  sass-lint
  typescript
  @angular/cli
)

echo "·${purple} npm install -g ${node_packages[@]}${reset}"
npm install -g ${node_packages[@]}
