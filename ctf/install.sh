#!/bin/bash
set -e

# default folders
mkdir -p $HOME/src $HOME/work

# dependencies
sudo apt-get update
sudo apt-get install -y --no-install-recommends curl git build-essential gdb python python-pip libpython-dev

# tmux
curl -LSso $HOME/.tmux.conf https://raw.githubusercontent.com/jroimartin/dotfiles/master/tmux18.conf

# vim
curl -LSso $HOME/.vimrc https://raw.githubusercontent.com/jroimartin/dotfiles/master/vimrc

# go
git clone https://go.googlesource.com/go ~/go1.4
cd ~/go1.4 && git checkout release-branch.go1.4
cd ~/go1.4/src && ./make.bash

cp -R ~/go1.4 ~/go
cd ~/go && git clean -dfx && git reset --hard && git checkout go1.9.4
cd ~/go/src && ./make.bash

mkdir -p ~/gocode
GOPATH=$HOME/gocode ~/go/bin/go get golang.org/x/tools/cmd/...

echo 'export GOPATH=$HOME/gocode
export PATH=$HOME/go/bin:$GOPATH/bin:$PATH
export EDITOR=vim' >> ~/.profile

# radare2
git clone https://github.com/radare/radare2.git ~/src/radare2
cd ~/src/radare2 && ./sys/install.sh

# gdb
echo "set disassembly-flavor intel" > ~/.gdbinit
