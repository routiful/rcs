#!/bin/bash

function cecho() {
  local exp=$1;
  tput setaf 3;
  tput bold
  echo -e $exp;
  tput sgr0;
}

CWD=`pwd`

cecho "START"
cecho ""

cecho "Update and Upgrade"
sudo apt update -y && sudo apt upgrade -y

cecho "Install NVIM"
sudo apt install vim -y
sudo apt install neovim -y

cecho "Install Some Dependencies"
sudo apt install -y \
  git \
  build-essential \
  cmake \
  python3-dev \
  clang-6.0 \
  libclang-6.0-dev \
  clang-format-6.0 \
  python-clang-6.0 \
  clang-tidy-6.0 \
  libc++-dev \
  lldb-6.0 \
  lld-6.0 \
  exuberant-ctags

cecho "Install Some tools"
sudo apt install -y \
  byobu

cecho "Install Vundle"
cd
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cecho "Install fzf"
cd
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'" >> ~/.bashrc
source ~/.bashrc

cecho "Copy vimrc"
sudo cp -r $CWD/vim/* $HOME/.vim/

cecho "Copy init.vim"
sudo cp $CWD/init.vim $HOME/.config/nvim/

cecho "Copy tigrc"
sudo cp -f $CWD/tigrc $HOME/.tigrc

cecho "Install Plugins"
vim +PluginInstall +qall

cecho ""
cecho "END"
