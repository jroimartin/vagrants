#!/bin/bash
set -e

sudo apt-get update
sudo apt-get install -y --no-install-recommends curl git build-essential
sudo apt-get clean

curl -LSso $HOME/.vimrc https://raw.githubusercontent.com/jroimartin/dotfiles/master/vimrc

curl -LSso $HOME/.tmux.conf https://raw.githubusercontent.com/jroimartin/dotfiles/master/tmux18.conf
echo 'export EDITOR=vim' >> $HOME/.profile

curl -LSso $HOME/.gitconfig https://raw.githubusercontent.com/jroimartin/dotfiles/master/gitconfig
