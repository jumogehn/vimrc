## About

.vimrc
- Makes vim more useful to work on C/C++/Java projects (and possibly other projects too)
- Includes many useful short-cut key mappings
- Includes many useful vim plugins (via Vundle)

mkcscope.sh
- Good script to generate cscope.out

mkctags.sh
- Good script to generate ctags

Testing environment
- Ubuntu 12.04

Prerequisite
- (sudo apt-get install) vim exuberant-ctags cscope

Note
- .inc file is treated as C++ source file


## Install Guide

.vimrc

0. Backup your .vim/ and .vimrc

1. Place Journeyer's .vimrc in your home directory

2. Install the vim plugin Vundle
```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```
(Refer to https://github.com/gmarik/vundle)

3. Open vim and :BundleInstall

mkcscope.sh & mkctags.sh

1. Place Journeyer's scripts(mkcscope.sh & mkctags.sh) under /usr/local/bin

2. Provide proper execution permission (to others) or change the owner of the file so that these can run by your call
```
for example) sudo chmod o+x mkcscope.sh mkctags.sh
```

## Using scripts

There is a rule to use these scripts.
- Generate ctags and cscope.out (by running mkcscope.sh and mkctags.sh) in a top directory of your project
- Open vim from the top directory of your project



## Sources

These small scripts are copied and pasted from the sources below.

http://kangcom.com/sub/view.asp?sku=201008310017&mcd=571

http://kldp.org/node/125263

http://kldp.org/

http://www.iamroot.org/

http://stackoverflow.com/

Thanks to the contributors(known and unknown) from the above, we could happy vim.

Any feedback including contributing is highly hunted.
- Some good vim script snippets, 
- Some good settings, 
- Some good configurations, 
- Some good vim plugin,
- Your opinion about the current vimrc file and 
- Bug report, 
- etc. (Lunch or coffee is possible ^^)

Your happy use of these small scripts is surely welcome.



Journeyer J. Joh

