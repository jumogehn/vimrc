
if isdirectory('$HOME/local/include')
  set path+=$HOME/local/include
endif

if filereadable("$HOME/local/include/boost/tags")
  set tags+=$HOME/local/include/boost/tags
endif

if filereadable("$HOME/local/include/boost/cscope.out")
  set nocsverb
  cs add $HOME/local/include/boost/cscope.out
  set csverb
endif

