#!/bin/bash -e

VERSION=1.19.5

cd $DIRECTORY_INSTALL

echo "Installing go ${VERSION}..."

curl -sSL https://dl.google.com/go/go${VERSION}.linux-amd64.tar.gz -o go.linux-amd64.tar.gz
tar -C /usr/local -xzf go.linux-amd64.tar.gz
rm go.linux-amd64.tar.gz

mkdir -p ~/go/{bin,pkg,src}
echo 'export GOPATH="$HOME/go"' >> ~/.bashrc
echo 'export PATH="$PATH:${GOPATH//://bin:}/bin"' >> ~/.bashrc
