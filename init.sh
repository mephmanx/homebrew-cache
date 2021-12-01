#!/bin/bash

echo "Building homebrew cache and configuring active terraform version as -> $1"

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh -o /tmp/homebrew.sh > /dev/null
cd /tmp
chmod +x /tmp/homebrew.sh
./homebrew.sh </dev/null
PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew install cloudfoundry/tap/bosh-cli
brew install bbl
brew unlink terraform
brew install tfenv
tfenv install $1
tfenv use $1
mkdir -p /tmp/export
cd /home/linuxbrew
tar -zcvf /tmp/export/homebrew.tar.gz .linuxbrew
gunzip /tmp/export/homebrew.tar.gz
mv /tmp/export/homebrew.tar /tmp/export/homebrew-$1.tar