#!/bin/bash
set -e

# dependencies
sudo apt-get update
sudo apt-get install -y --no-install-recommends curl git build-essential gdb gnupg \
	python python-pip libpython-dev python-qt4 cmake

# rvm, ruby
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable
. ~/.rvm/scripts/rvm
rvm install 2.3
rvm --default use 2.3
rvm docs generate

# vim configs
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
curl -LSso ~/.vimrc https://raw.githubusercontent.com/jroimartin/dotfiles/master/vimrc
git clone https://github.com/vim-ruby/vim-ruby.git ~/.vim/bundle/vim-ruby
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp

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
