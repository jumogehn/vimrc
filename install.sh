#!/bin/bash
# This script needs sudoer's right to work correctly

# Must run where those files exist
if [ -e ".vimrc" ]; then
if [ -e ".llvm.vimrc" ]; then
if [ -e "mkctags.sh" ]; then
if [ -e "mkcscope.sh" ]; then

# Remove previously installed symbolic links
if [ -L "$HOME/.vimrc" ]; then
  rm -f $HOME/.vimrc
fi
if [ -L "$HOME/.llvm.vimrc" ]; then
  rm -f $HOME/.llvm.vimrc
fi

# Backup your .vim/ and .vimrc in your home directory if they exist
if [ -e "$HOME/.vim" ]; then
  if [ -e "$HOME/.vim_backup" ]; then
  else
    mv $HOME/.vim $HOME/.vim_backup
  fi
fi
if [ -e "$HOME/.vimrc" ]; then
  if [ -e "$HOME/.vimrc_backup" ]; then
  else
    mv $HOME/.vimrc $HOME/.vimrc_backup
  fi
fi

# Create new symbolic links to the .vimrc files checked-out
ln -s -T `pwd`/.vimrc $HOME/.vimrc
ln -s -T `pwd`/.llvm.vimrc $HOME/.llvm.vimrc

# Install Vundle
git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

# Open vim and :BundleInstall
echo
echo ==============================================
echo You must Open vim and :BundleInstall yourself!
echo ==============================================
echo

# Remove previously installed symbolic links
if [ -L "/usr/local/bin/mkctags.sh" ]; then
  sudo rm -f /usr/local/bin/mkctags.sh
fi
if [ -L "/usr/local/bin/mkcscope.sh" ]; then
  sudo rm -f /usr/local/bin/mkcscope.sh
fi

# Create new symbolic links to mkcscope.sh and mkctags.sh
sudo ln -s -T `pwd`/mkctags.sh /usr/local/bin/mkctags.sh
sudo ln -s -T `pwd`/mkcscope.sh /usr/local/bin/mkcscope.sh
sudo chown -h `whoami`:`whoami` /usr/local/bin/mkctags.sh
sudo chown -h `whoami`:`whoami` /usr/local/bin/mkcscope.sh

fi
fi
fi
fi
