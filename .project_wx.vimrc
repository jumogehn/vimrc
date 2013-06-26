
if isdirectory('/usr/include/wx-2.6')
  set path+=/usr/include/wx-2.6
endif

if filereadable("/usr/include/wx-2.6/wx/tags")
  set tags+=/usr/include/wx-2.6/wx/tags
endif

if filereadable("/usr/include/wx-2.6/wx/cscope.out")
  set nocsverb
  cs add /usr/include/wx-2.6/wx/cscope.out
  set csverb
endif

