#!/bin/bash -e

VERSION=1.22.11

cd /usr/local/bin

echo "Installing kubectl ${VERSION}..."
curl -LO https://storage.googleapis.com/kubernetes-release/release/v${VERSION}/bin/linux/amd64/kubectl
chmod u+x kubectl
