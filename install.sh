#!/bin/bash

# Must run where those files exist
if [ -e ".vimrc" ]; then
if [ -e ".cncpp.vimrc" ]; then
if [ -e ".system.vimrc" ]; then
if [ -e "mkctags.sh" ]; then
if [ -e "mkcscope.sh" ]; then
if [ -e "rmtags.sh" ]; then

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

# Backup your .vim/ and .vimrc in your home directory if they exist
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

# Create new symbolic links to the .vimrc files checked-out
ln -s -T `pwd`/.vimrc $HOME/.vimrc
ln -s -T `pwd`/.cncpp.vimrc $HOME/.cncpp.vimrc
ln -s -T `pwd`/.system.vimrc $HOME/.system.vimrc

# Install Vundle
if [ -e "$HOME/.vim/bundle/Vundle.vim" ]; then
  rm -rf $HOME/.vim/bundle/Vundle.vim
fi
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

mkdir -p $HOME/.vim/syntax
ln -s -T `pwd`/php.vim $HOME/.vim/syntax/php.vim

# Open vim and :BundleInstall
echo
echo ==============================================
echo You must Open vim and :PluginInstall yourself!
echo ==============================================
echo

# Remove previously installed symbolic links
if [ -L "/usr/local/bin/mkctags.sh" ]; then
  sudo rm -f /usr/local/bin/mkctags.sh
fi

if [ -L "/usr/local/bin/mkcscope.sh" ]; then
  sudo rm -f /usr/local/bin/mkcscope.sh
fi

if [ -L "/usr/local/bin/rmtags.sh" ]; then
  sudo rm -f /usr/local/bin/rmtags.sh
fi
if [ -L "/usr/local/bin/svndiff-meld.sh" ]; then
  sudo rm -f /usr/local/bin/svndiff-meld.sh
fi
if [ -L "/usr/local/bin/svndiff-vim.sh" ]; then
  sudo rm -f /usr/local/bin/svndiff-vim.sh
fi

# Create new symbolic links to mkcscope.sh and mkctags.sh and rmtags.sh
sudo ln -s -T `pwd`/mkctags.sh /usr/local/bin/mkctags.sh
sudo ln -s -T `pwd`/mkcscope.sh /usr/local/bin/mkcscope.sh
sudo ln -s -T `pwd`/rmtags.sh /usr/local/bin/rmtags.sh
sudo ln -s -T `pwd`/svndiff-meld.sh /usr/local/bin/svndiff-meld.sh
sudo ln -s -T `pwd`/svndiff-vim.sh /usr/local/bin/svndiff-vim.sh
sudo chown -h `whoami`:`whoami` /usr/local/bin/mkctags.sh
sudo chown -h `whoami`:`whoami` /usr/local/bin/mkcscope.sh
sudo chown -h `whoami`:`whoami` /usr/local/bin/rmtags.sh
sudo chown -h `whoami`:`whoami` /usr/local/bin/svndiff-meld.sh
sudo chown -h `whoami`:`whoami` /usr/local/bin/svndiff-vim.sh

fi
fi
fi
fi
fi
fi
