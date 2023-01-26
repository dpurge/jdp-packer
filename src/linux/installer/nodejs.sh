#!/bin/bash -e

NVM_VERSION=0.39.3

git clone https://github.com/nvm-sh/nvm.git /opt/nvm
cd /opt/nvm
git checkout v$NVM_VERSION

ed -s ~/.profile <<'EOF'
$a

export NVM_DIR="$HOME/.nvm"

if [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
fi

if [ -s "$NVM_DIR/bash_completion" ]; then
  . "$NVM_DIR/bash_completion"
fi

.
w
q
EOF

. ~/.profile

# nvm install node
# nvm install-latest-npm
# npm install -g yarn
