## About

### .vimrc
- Makes vim more useful to work on C/C++/Java projects (and possibly other projects too)
- Includes many useful short-cut key mappings
- Includes many useful vim plugins (via Vundle)

### mkcscope.sh
- Good script to generate cscope.out

### mkctags.sh
- Good script to generate ctags

Testing environment
- Ubuntu 12.04

Prerequisite
- git-core vim exuberant-ctags cscope

Note

.inc file and .def file are treated as C++ source file. All the places related this is listed below.
- mkcscope.sh : 
   ```
   -o -name '*.inc' -o -name '*.def'
   ```
- mkctags.sh : 
   ```
   --langmap=C++:+.inc+.def
   ```


## Install Guide
### Clone Journeyer's repository
```
$ git clone git://github.com/Journeyer/vimrc.git
```

This makes new directory 'vimrc', which is your local reposiory clone.

Let's assume you do this in your home directory

### Install .vimrc

1. Backup your .vim/ and .vimrc in your home directory if they exist
   ```
   $ mv .vim/ vim_backup/
   $ mv .vimrc vimrc_backup
   ```

2. Create a symbolic link to the check-outted .vimrc file

   ```
   $ ln -s -T vimrc/.vimrc .vimrc
   ```

3. Install Vundle

   ```
   $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
   ```

   (Refer to https://github.com/gmarik/vundle)

4. Open vim and :BundleInstall

   ```
   $ vim
   :BundleInstall
   ```


### Install mkcscope.sh & mkctags.sh

1. Go to /usr/local/bin

   ```
   $ cd /usr/local/bin
   ```

2. Create symbolic links to the check-outted files, mkcscope.sh and mkctags.sh

   ```
   $ sudo ln -s -T ~/vimrc/mkctags.sh mkctags.sh
   $ sudo ln -s -T ~/vimrc/mkcscope.sh mkcscope.sh
   ```


## Using scripts

There is a rule to use these scripts.
- Generate ctags and cscope.out (by running mkcscope.sh and mkctags.sh) in a top directory of your project
   ```
   $ mkctags.sh
   $ mkcscope.sh
   ```

   To close cscope after cscope finished it's job, press CTRL+D.

- Open vim from the top directory of your project

   If you open vim other places than where those tags files exist, vim cannot use those tags files.
   
   If you don't need to use tags files along with vim, you can open vim anywhere you want.

## Feedback Hunted

Any feedback including contributing is highly hunted.
- Some good vim script snippets, 
- Some good settings, 
- Some good configurations, 
- Some good vim plugin,
- Your opinion about the current vimrc file and 
- Bug report, 
- etc. (Lunch or coffee is a possible Mandatory!! ^^;)

Your happy use of these small scripts is surely welcome.


## TODO
- Project specific settings in mkctags.sh and mkcscope.sh have to be seperated into project specific different files so that open scripts only contains common general settings

## References

- http://kangcom.com/sub/view.asp?sku=201008310017&mcd=571
- http://kldp.org/node/125263
- http://kldp.org/
- http://www.iamroot.org/
- http://stackoverflow.com/

Thanks to the authors and contributors (known and unknown) above, we could happy vim.


Journeyer J. Joh

