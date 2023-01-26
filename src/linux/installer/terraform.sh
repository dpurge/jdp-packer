#!/bin/bash -e

TFSWITCH_VERSION=0.13.1300
TERRAFORM_VERSION=1.3.4
TFLINT_VERSION=0.38.1

cd /usr/local/bin

echo "Installing tfswitch ${TFSWITCH_VERSION}..."
curl -sSL https://github.com/warrensbox/terraform-switcher/releases/download/${TFSWITCH_VERSION}/terraform-switcher_${TFSWITCH_VERSION}_linux_amd64.tar.gz -o tfswitch_linux_amd64.tar.gz
tar -xf tfswitch_linux_amd64.tar.gz tfswitch
rm tfswitch_linux_amd64.tar.gz

echo "Installing terraform ${TERRAFORM_VERSION}..."
tfswitch $TERRAFORM_VERSION

echo "Installing tflint ${TFLINT_VERSION}..."
curl -sSL https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VERSION}/tflint_linux_amd64.zip -o tflint_linux_amd64.zip
unzip tflint_linux_amd64.zip
rm tflint_linux_amd64.zip
