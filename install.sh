#####!/bin/bash
#####!/bin/zsh

# Must run where those files exist
if [ -e ".vimrc" -a \
  -e ".cncpp.vimrc" -a \
  -e ".system.vimrc" -a \
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
if [ -L "$HOME/.system.vimrc" ]; then
  rm -f $HOME/.system.vimrc
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
ln -s `pwd`/.system.vimrc $HOME/.system.vimrc
#ln -s `pwd`/.system.vimrc.aosp $HOME/.system.vimrc

# Install Vundle
if [ -e "$HOME/.vim/bundle/Vundle.vim" ]; then
  rm -rf $HOME/.vim/bundle/Vundle.vim
fi
git clone https://github.com/VundleVim/Vundle.vim.git \
  $HOME/.vim/bundle/Vundle.vim

# Open vim and :BundleInstall
echo
echo "=============================================="
echo "You must Open vim and :PluginInstall yourself!"
echo "=============================================="

mkdir -p $HOME/.bin
# Remove previously installed symbolic links
rm -f $HOME/.bin/mkctags.sh
rm -f $HOME/.bin/mkcscope.sh
rm -f $HOME/.bin/rmtags.sh

# Create new symbolic links to mkcscope.sh and mkctags.sh and rmtags.sh
ln -s `pwd`/mkctags.sh $HOME/.bin/mkctags.sh
ln -s `pwd`/mkcscope.sh $HOME/.bin/mkcscope.sh
ln -s `pwd`/rmtags.sh $HOME/.bin/rmtags.sh

echo "=============================================="
echo "You must make sure $HOME/.bin is in your PATH env."
echo "=============================================="
echo

fi
