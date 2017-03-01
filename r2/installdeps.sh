#!/bin/bash
set -e

sudo apt-get update
sudo apt-get install -y --no-install-recommends curl git build-essential
sudo apt-get clean

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
curl -LSso ~/.vimrc https://raw.githubusercontent.com/jroimartin/dotfiles/master/vimrc
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

echo 'export EDITOR=vim' >> ~/.profile

curl -LSso ~/.gitconfig https://raw.githubusercontent.com/jroimartin/dotfiles/master/gitconfig
