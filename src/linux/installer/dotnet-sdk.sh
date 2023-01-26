#!/bin/bash -e

VERSION=7.0

echo "Installing .NET SDK ${VERSION}..."
apt-get install -y dotnet-sdk-$VERSION
