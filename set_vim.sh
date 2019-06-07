#!/bin/bash

cecho "START"
cecho ""

cecho "Update and Upgrade"
sudo apt update -y
sudo apt upgrade -y

cecho "Install VIM"
sudo apt install vim

cecho "Install Dependencies"
sudo apt install build-essential cmake python3-dev clang-6.0 libclang-6.0-dev clang-format-6.0 python-clang-6.0 clang-tidy-6.0 libc++-dev lldb-6.0 lld-6.0 exuberant-ctags

cecho "Install Vundle"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cecho "Copy vimrc"
cp -f $HOME/vimrc/vimrc $HOME/.vimrc

cecho "Please execute :PluginInstall command when you open the vim for the first time"

cecho ""
cecho "END"
