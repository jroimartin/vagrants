#!/bin/bash
set -e

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
curl -LSso ~/.vimrc https://raw.githubusercontent.com/jroimartin/dotfiles/master/vimrc
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

git clone https://go.googlesource.com/go ~/go1.4
cd ~/go1.4 && git checkout go1.4.2
cd ~/go1.4/src && ./make.bash

cp -R ~/go1.4 ~/go
cd ~/go && git clean -dfx && git reset --hard && git checkout go1.5.2
cd ~/go/src && ./make.bash

mkdir -p ~/gocode
GOPATH=$HOME/gocode ~/go/bin/go get golang.org/x/tools/... github.com/nsf/gocode

~/gocode/src/github.com/nsf/gocode/vim/pathogen_update.sh

echo 'export GOPATH=$HOME/gocode
export PATH=$HOME/go/bin:$GOPATH/bin:$PATH
export EDITOR=vim' >> ~/.profile

echo '[user]
	name = Roi Martin
	email = jroi.martin@gmail.com
[push]
	default = simple' >> ~/.gitconfig
