#!/bin/bash
set -e

# dependencies
sudo apt-get update
sudo apt-get install -y --no-install-recommends curl git build-essential gdb gnupg python python-pip libpython-dev python-qt4 cmake

# vim
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
curl -LSso ~/.vimrc https://raw.githubusercontent.com/jroimartin/dotfiles/master/vimrc
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive

# go
git clone https://go.googlesource.com/go ~/go1.4
cd ~/go1.4 && git checkout release-branch.go1.4
cd ~/go1.4/src && ./make.bash

cp -R ~/go1.4 ~/go
cd ~/go && git clean -dfx && git reset --hard && git checkout go1.7.4
cd ~/go/src && ./make.bash

mkdir -p ~/gocode
GOPATH=$HOME/gocode ~/go/bin/go get golang.org/x/tools/... github.com/nsf/gocode

~/gocode/src/github.com/nsf/gocode/vim/pathogen_update.sh

echo 'export GOPATH=$HOME/gocode
export PATH=$HOME/go/bin:$GOPATH/bin:$PATH
export EDITOR=vim' >> ~/.profile

# rvm, ruby
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable
. ~/.rvm/scripts/rvm
rvm install 2.3
rvm --default use 2.3
rvm docs generate

# src
mkdir -p ~/src

# vivisect
git clone https://github.com/vivisect/vivisect.git ~/src/vivisect

# metasm
git clone https://github.com/jjyg/metasm.git ~/src/metasm

# radare2
git clone https://github.com/radare/radare2.git ~/src/radare2
cd ~/src/radare2 && ./sys/install.sh

# peda
git clone https://github.com/longld/peda.git ~/src/peda
echo "set disassembly-flavor intel" > ~/.gdbinit
echo "source ~/src/peda/peda.py" >> ~/.gdbinit

# capstone, keystone
sudo pip install capstone keystone-engine

# ropgadget
sudo pip install ropgadget

# pwntools
sudo pip install pwntools
