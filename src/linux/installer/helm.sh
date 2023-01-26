#!/bin/bash -e

VERSION=3.9.2

cd /usr/local/bin

echo "Installing helm ${VERSION}..."
curl -sSL https://get.helm.sh/helm-v${VERSION}-linux-amd64.tar.gz -o helm.tar.gz
tar xf helm.tar.gz linux-amd64/helm
mv linux-amd64/helm helm
rmdir linux-amd64
rm helm.tar.gz
