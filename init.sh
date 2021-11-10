#!/bin/bash

curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh -o /tmp/homebrew.sh > /dev/null
cd /tmp
chmod +x /tmp/homebrew.sh
./homebrew.sh </dev/null
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
brew install cloudfoundry/tap/bosh-cli
brew install bbl
brew unlink terraform
brew install tfenv
tfenv install $1
tfenv use $1
mkdir -p /tmp/export
tar -zcvf /tmp/export/homebrew.tar.gz /home/linuxbrew