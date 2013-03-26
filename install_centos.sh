#!/bin/csh
# This script needs sudoer's right to work correctly

# Must run where those files exist
if ( -e .vimrc ) then
if ( -e .llvm.vimrc ) then
if ( -e mkctags.sh ) then
if ( -e mkcscope.sh ) then
if ( -e rmtags.sh ) then

# Remove previously installed symbolic links
if ( -e $home/.vimrc ) then
  rm -f $home/.vimrc
endif
if ( -e $home/.llvm.vimrc ) then
  rm -f $home/.llvm.vimrc
endif

# Backup your .vim/ and .vimrc in your home directory if they exist
if ( -e $home/.vim ) then
  if ( ! -e $home/.vim_backup ) then
    mv $home/.vim $home/.vim_backup
  else
    rm -rf $home/.vim
  endif
endif
if ( -e $home/.vimrc ) then
  if ( ! -e $home/.vimrc_backup ) then
    mv $home/.vimrc $home/.vimrc_backup
  else
    rm -rf $home/.vimrc
  endif
endif

# Create new symbolic links to the .vimrc files checked-out
ln -s -T `pwd`/.vimrc $home/.vimrc
ln -s -T `pwd`/.llvm.vimrc $home/.llvm.vimrc

# Install Vundle
if ( -e $home/.vim/bundle/vundle ) then
  rm -rf $home/.vim/bundle/vundle
endif
git clone https://github.com/gmarik/vundle.git $home/.vim/bundle/vundle

# Open vim and :BundleInstall
echo
echo ==============================================
echo You must Open vim and :BundleInstall yourself!
echo ==============================================
echo

# Remove previously installed symbolic links
if ( -e $home/local/bin/mkctags.sh ) then
  rm -f $home/local/bin/mkctags.sh
endif
if ( -e $home/local/bin/mkcscope.sh ) then
  rm -f $home/local/bin/mkcscope.sh
endif
if ( -e $home/local/bin/rmtags.sh ) then
  rm -f $home/local/bin/rmtags.sh
endif

# Create new symbolic links to mkcscope.sh and mkctags.sh and rmtags.sh
ln -s -T `pwd`/mkctags.sh $home/local/bin/mkctags.sh
ln -s -T `pwd`/mkcscope.sh $home/local/bin/mkcscope.sh
ln -s -T `pwd`/rmtags.sh $home/local/bin/rmtags.sh
chown -h `whoami`:`groups` $home/local/bin/mkctags.sh
chown -h `whoami`:`groups` $home/local/bin/mkcscope.sh
chown -h `whoami`:`groups` $home/local/bin/rmtags.sh

endif
endif
endif
endif
endif

