cecho "Copy vimrc"
sudo cp -r $CWD/vim/* $HOME/.vim/

cecho "Copy init.vim"
sudo cp $CWD/init.vim $HOME/.config/nvim/

cecho "Copy tigrc"
sudo cp -f $CWD/tigrc $HOME/.tigrc
