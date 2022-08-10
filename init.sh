#!/bin/bash

echo "Building homebrew cache and configuring active terraform version as -> $1"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
PATH=$PATH:/home/linuxbrew/.linuxbrew/bin

#temp to use this repo, after upstream get merged, just delete those lines.
brew tap yaguangtang/tap
brew install yaguangtang/tap/bosh-cli
brew install yaguangtang/tap/bbl
brew install yaguangtang/tap/cf-cli@8

#brew install cloudfoundry/tap/bosh-cli
#brew install bbl
#brew install cloudfoundry/tap/cf-cli@8

brew unlink terraform
brew install tfenv
tfenv install "$1"
tfenv use "$1"
mkdir -p /tmp/export
cd /home/linuxbrew || exit
tar -zcvf /tmp/export/homebrew.tar.gz .linuxbrew
gunzip /tmp/export/homebrew.tar.gz
mv /tmp/export/homebrew.tar /tmp/export/homebrew-"$1".tar
