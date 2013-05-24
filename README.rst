
.. image:: docs/_static/imgs/screen_.jpg
   :scale: 50 %
   :alt: screen capture

News
====

- Install script(install.sh) is added     2013.1.31
- LLVM vimrc is added                     2013.1.30
- LICENSE of LLVM is added and applied    2013.1.30
- Install Guide is updated                2013.1.30

About
=====

.llvm.vimrc
-----------

- copied from llvm project(llvm/utils/vim/vimrc)
- forces LLVM coding style guideline(for example, 80 column width, no tab, ...)
- check 'Recommended Coding Style from LLVM' below

.vimrc
------

- Makes vim more useful to work on C/C++/Java projects
  (and possibly other projects too)
- Includes many useful short-cut key mappings
- Includes many useful vim plugins (via Vundle)

mkcscope.sh
-----------

- Good script to generate cscope.out

mkctags.sh
----------

- Good script to generate ctags

rmtags.sh
---------

- Good script to remove ctags, cscope.out and cscope.files

Testing environment

- Ubuntu 12.04

Prerequisite

- git-core vim exuberant-ctags cscope

Note

.inc file and .def file are treated as C++ source file.
All the places related this is listed below.

- mkcscope.sh
::

 -o -name '*.inc' -o -name '*.def'

- mkctags.sh
::

 --langmap=C++:+.inc+.def


Using scripts
=============

There is a rule to use these scripts.

- Generate ctags and cscope.out (by running mkcscope.sh and mkctags.sh)
  in a top directory of your project
::

 $ mkctags.sh
 $ mkcscope.sh

To close cscope after cscope finished it's job, press CTRL+D.

- Open vim from the top directory of your project

If you open vim other places than where those tags files exist,
vim cannot use those tags files.

If you don't need to use tags files along with vim,
you can open vim anywhere you want.


Recommended Coding Style from LLVM
==================================

- http://llvm.org/docs/CodingStandards.html#coding-standards

Journeyer's vimrc is now dependent on LLVM's. For this reason,
LLVM coding style is recommended.


Feedback Hunted
===============

Any feedback including contributing is highly hunted.

- Some good vim script snippets,
- Some good settings,
- Some good configurations,
- Some good vim plugin,
- Your opinion about the current vimrc file and
- Bug report,
- etc. (Lunch or coffee is a possible Mandatory!! ^^;)

Your happy use of these small scripts is surely welcome.


TODO
====

- Install script must support other linux distributions
  and Unix, Mac, and even Windows hopely.
- Project specific settings in mkctags.sh and mkcscope.sh have to be seperated
  into project specific different files so that
  open scripts only contains common general settings


References
==========

- http://kldp.org/node/125263
- http://kldp.org/
- http://stackoverflow.com/
- http://kangcom.com/sub/view.asp?sku=201008310017&mcd=571


Thanks to the authors and contributors (known and unknown) above,
we could happy vim.


Journeyer J. Joh

