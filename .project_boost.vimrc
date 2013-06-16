
if isdirectory('/home/hum/local/include')
  set path+=/home/hum/local/include
endif

if filereadable("/home/hum/local/include/boost/tags")
  set tags+=/home/hum/local/include/boost/tags
endif

if filereadable("/home/hum/local/include/boost/cscope.out")
  set nocsverb
  cs add /home/hum/local/include/boost/cscope.out
  set csverb
endif

