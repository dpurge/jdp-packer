#!/bin/bash -e

VERSION=1.7.10

echo "Installing packer ${VERSION}..."
cd /usr/local/bin
curl -sSL https://releases.hashicorp.com/packer/${VERSION}/packer_${VERSION}_linux_amd64.zip -o packer_linux_amd64.zip
unzip packer_linux_amd64.zip
rm packer_linux_amd64.zip
