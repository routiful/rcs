cecho "Copy vimrc"
sudo cp -rf $CWD/vim/* $HOME/.vim/

cecho "Copy init.vim"
sudo cp -rf $CWD/init.vim $HOME/.config/nvim/

cecho "Copy tigrc"
sudo cp -rf $CWD/tigrc $HOME/.tigrc
