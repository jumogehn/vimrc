#####!/bin/bash
#####!/bin/zsh

# PREREQUISITES ======================================
# Make sure use Vim >= 8.1.1719
# Install nodejs >= 14.14:

# YOU MUST INSTALL NODEJS AS A ROOT (VIA 'sudo su'):
# $curl -sL install-node.vercel.app/lts | bash
# AND THEN REBOOT THE SYSTEM
# ====================================================

# Must run where those files exist
if [ -e ".vimrc" -a \
  -e ".cncpp.vimrc" -a \
  -e ".coc.nvimrc" -a \
  -e "mkctags.sh" -a \
  -e "mkcscope.sh" -a \
  -e "rmtags.sh" ]; then

# Remove previously installed symbolic links
if [ -L "$HOME/.vimrc" ]; then
  rm -f $HOME/.vimrc
fi
if [ -L "$HOME/.cncpp.vimrc" ]; then
  rm -f $HOME/.cncpp.vimrc
fi
if [ -L "$HOME/.coc.nvimrc" ]; then
  rm -f $HOME/.coc.nvimrc
fi

# Backup your original .vim/ and .vimrc in your home directory if they exist
# Make sure ONLY THE FIRST ORIGINAL .VIM/ AND .VIMRC is being backed up
if [ -e "$HOME/.vim" ]; then
  if ! [ -e "$HOME/.vim_backup" ]; then
    mv $HOME/.vim $HOME/.vim_backup
  else
    rm -rf $HOME/.vim
  fi
fi
if [ -e "$HOME/.vimrc" ]; then
  if ! [ -e "$HOME/.vimrc_backup" ]; then
    mv $HOME/.vimrc $HOME/.vimrc_backup
  else
    rm -rf $HOME/.vimrc
  fi
fi

# Create new symbolic links to the *.vimrc files
ln -s `pwd`/.vimrc $HOME/.vimrc
ln -s `pwd`/.cncpp.vimrc $HOME/.cncpp.vimrc
ln -s `pwd`/.coc.nvimrc $HOME/.coc.nvimrc

## Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Open vim and :PlugInstall
echo
echo "==================================================================="
echo "You must Open vim and "
echo " - \":PlugInstall\""
echo " - \":CocInstall coc-clangd coc-json\""
echo " - \":CocConfig\"(Optional)"
echo "Refer to :"
echo " - https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim"
echo " - https://github.com/neoclide/coc.nvim/wiki/Language-servers#ccobjective-c"
echo " - https://80000coding.oopy.io/62d92ae6-545a-4727-8dcb-6b31d148e732"
echo "==================================================================="

mkdir -p $HOME/.bin
# Remove previously installed symbolic links
rm -f $HOME/.bin/mkctags.sh
rm -f $HOME/.bin/mkcscope.sh
rm -f $HOME/.bin/rmtags.sh

# Create new symbolic links to mkcscope.sh and mkctags.sh and rmtags.sh
ln -s `pwd`/mkctags.sh $HOME/.bin/mkctags.sh
ln -s `pwd`/mkcscope.sh $HOME/.bin/mkcscope.sh
ln -s `pwd`/rmtags.sh $HOME/.bin/rmtags.sh

echo "=================================================="
echo "You must make sure $HOME/.bin is in your PATH env."
echo "=================================================="
echo

fi
