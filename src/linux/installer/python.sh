#!/bin/bash -e

PYTHON_VERSION=3.11.1

curl https://pyenv.run | bash

ed -s ~/.profile <<'EOF'
$a

export PATH="$HOME/.pyenv/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi

.
w
q
EOF

. ~/.profile

pyenv install $PYTHON_VERSION
pyenv global $PYTHON_VERSION

pip install invoke
pip install pipenv
