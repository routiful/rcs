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
sudo apt update -y && sudo apt upgrade -y

cecho "Install Some Dependencies"
sudo apt install -y \
  git \
  wget \
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
  exuberant-ctags \
  tig

cecho "Install Some tools"
sudo apt install -y \
  byobu

cecho "Install NVIM 0.5.0"
HW_ARCH=$(dpkg --print-architecture)

if [ "$HW_ARCH" = "arm64" ]; then
  sudo apt install -y neovim*
else
  cd ${HOME}
  wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
  sudo chmod u+x nvim.appimage
  ./nvim.appimage --appimage-extract
fi

echo "export PATH=$PATH:$HOME/squashfs-root/usr/bin" >> ~/.bashrc
echo "alias vim='nvim'" >> ~/.bashrc

rm nvim.appimage

cecho "Install Vundle"
cd ${HOME}
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cecho "Install fzf"
cd ${HOME}
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'" >> ~/.bashrc
source ~/.bashrc

cecho "Copy vimrc"
cp -rf vim/* ~/.vim/

cecho "Copy init.vim"
mkdir $HOME/.config/nvim
cp -rf init.vim ~/.config/nvim/

cecho "Copy tigrc"
cp -rf tigrc ~/.tigrc

cecho "Install Plugins"
vim +PluginInstall +qall

cecho ""
cecho "END"
