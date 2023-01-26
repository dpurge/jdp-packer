#!/bin/bash -e

apt-get update
apt-get install -y \
  apt-transport-https \
  software-properties-common \
  ca-certificates \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libncursesw5-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev \
  llvm \
  xz-utils \
  tk-dev \
  ed \
  gpg \
  git \
  jq \
  curl \
  unzip \
  wget \
  zsh

cd $DIRECTORY_INSTALL

# Microsoft repository GPG keys
echo "Installing Microsoft repository GPG keys..."
curl -sSL "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb" -o packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

apt-get update
