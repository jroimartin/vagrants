#!/bin/bash
set -e

sudo apt-get update
sudo apt-get install -y --no-install-recommends curl git build-essential gdb gnupg python python-pip libpython-dev python-qt4

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
curl -LSso ~/.vimrc https://raw.githubusercontent.com/jroimartin/dotfiles/master/vimrc
git clone https://github.com/vim-ruby/vim-ruby.git ~/.vim/bundle/vim-ruby

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
. ~/.rvm/scripts/rvm
rvm install 2.2
rvm --default use 2.2
rvm docs generate

mkdir -p ~/src

git clone https://github.com/vivisect/vivisect.git ~/src/vivisect
git clone https://github.com/jjyg/metasm.git ~/src/metasm

git clone https://github.com/radare/radare2.git ~/src/radare2
cd ~/src/radare2 && ./configure && make && sudo make install
git clone https://github.com/radare/radare2-bindings.git ~/src/radare2-bindings

git clone https://github.com/longld/peda.git ~/src/peda
echo "set disassembly-flavor intel" > ~/.gdbinit
echo "source ~/src/peda/peda.py" >> ~/.gdbinit

sudo pip install capstone ropgadget pwntools
