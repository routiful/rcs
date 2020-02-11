#!/bin/bash

function cecho() {
  local exp=$1;
  tput setaf 3;
  tput bold
  echo -e $exp;
  tput sgr0;
}

cecho "START"
cecho ""

cecho "Update and Upgrade"
sudo apt update -y
sudo apt upgrade -y

cecho "Install VIM"
sudo apt install vim -y

cecho "Install Dependencies"
sudo apt install build-essential cmake python3-dev clang-6.0 libclang-6.0-dev clang-format-6.0 python-clang-6.0 clang-tidy-6.0 libc++-dev lldb-6.0 lld-6.0 exuberant-ctags

cecho "Install tmux"
sudo apt install tmux -y

cecho "Intall tmux config"
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

cecho "Install Vundle"
cd
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cecho "Copy vimrc"
cp -f $HOME/vimrc/vimrc $HOME/.vimrc

cecho "Install Plugins"
vim +PluginInstall +qall

cecho ""
cecho "END"
