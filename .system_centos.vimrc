
if isdirectory('/usr/include/c++/4.4.6')
  set path+=/usr/include/c++/4.4.6
endif

if isdirectory(expand('$TBBROOT'))
  set path+=$TBBROOT
endif

