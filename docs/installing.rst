

Install Guide
=============

Clone Journeyer's repository
----------------------------
::

 $ git clone git://github.com/Journeyer/vimrc.git

This makes new directory 'vimrc', which is your local reposiory clone.


Prerequisites
-------------
::

 vim
 exuberant-ctags
 cscope


Install with script
-------------------

1. You can simply install using install script. (Only tested on Ubuntu)
::

 $ cd vimrc
 $ ./install.sh

2. You must provide sudo password for doing this DURING the install.
But DO NOT INVOKE this script under sudo command your self.
Just run it WITHOUT sudo and provide sudo password **when you are asked**.
::

 provide sudo password only when you are asked

3. And after the script finished it's job, you Open vim and :BundleInstall
your self.
::

 $ vim
 $ :BundleInstall

If you want to install manually follow instructions below.

- Install .vimrc by manual
- Install mkcscope.sh & mkctags.sh by manual

Install .vimrc by manual
------------------------

1. Backup your .vim/ and .vimrc in your home directory if they exist
::

 $ cd ~
 $ mv .vim/ vim_backup/
 $ mv .vimrc vimrc_backup

2. Create symbolic links to the .vimrc files checked-out
::

 $ ln -s -T vimrc/.vimrc .vimrc
 $ ln -s -T vimrc/.llvm.vimrc .llvm.vimrc

It is assumed that you cloned Journeyer's vimrc under your home directory

3. Install Vundle
::

 $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

(Refer to https://github.com/gmarik/vundle)

4. Open vim and :BundleInstall
::

 $ vim
 :BundleInstall

Install mkcscope.sh & mkctags.sh by manual
------------------------------------------

1. Go to /usr/local/bin
::

 $ cd /usr/local/bin

2. Create symbolic links to mkcscope.sh and mkctags.sh
::

 $ sudo ln -s -T ~/vimrc/mkctags.sh mkctags.sh
 $ sudo ln -s -T ~/vimrc/mkcscope.sh mkcscope.sh
 $ sudo ln -s -T ~/vimrc/rmtags.sh rmtags.sh

3. Change file owner to you
::

 $ sudo chown -h `whoami`:`whoami` mkctags.sh
 $ sudo chown -h `whoami`:`whoami` mkcscope.sh
 $ sudo chown -h `whoami`:`whoami` rmtags.sh


