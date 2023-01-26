#!/bin/bash -e

TGSWITCH_VERSION=0.6.0
TERRAGRUNT_VERSION=0.40.2

cd /usr/local/bin

echo "Installing tgswitch ${TGSWITCH_VERSION}..."
curl -sSL https://github.com/warrensbox/tgswitch/releases/download/${TGSWITCH_VERSION}/tgswitch_${TGSWITCH_VERSION}_linux_amd64.tar.gz -o tgswitch_linux_amd64.tar.gz
tar -xf tgswitch_linux_amd64.tar.gz tgswitch
rm tgswitch_linux_amd64.tar.gz

echo "Installing terragrunt ${TERRAGRUNT_VERSION}..."
tgswitch $TERRAGRUNT_VERSION
