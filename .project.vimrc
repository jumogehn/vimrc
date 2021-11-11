
if filereadable("/usr/include/pcl-1.8/tags")
  set tags+=/usr/include/pcl-1.8/tags
endif

if filereadable("/usr/include/ifm3d/tags")
  set tags+=/usr/include/ifm3d/tags
endif

if filereadable("/usr/include/eigen3/tags")
  set tags+=/usr/include/eigen3/tags
endif

if filereadable("/usr/include/opencv/tags")
  set tags+=/usr/include/opencv/tags
endif

if filereadable("/usr/include/pcl-1.8/cscope.out")
  set nocsverb
  cs add /usr/include/pcl-1.8/cscope.out
  set csverb
endif

if filereadable("/usr/include/ifm3d/cscope.out")
  set nocsverb
  cs add /usr/include/ifm3d/cscope.out
  set csverb
endif

if filereadable("/usr/include/eigen3/cscope.out")
  set nocsverb
  cs add /usr/include/eigen3/cscope.out
  set csverb
endif

if filereadable("/usr/include/opencv/cscope.out")
  set nocsverb
  cs add /usr/include/opencv/cscope.out
  set csverb
endif

if isdirectory('/usr/include/c++/4.6')
  set path+=/usr/include/c++/4.6
endif

if isdirectory('/usr/include/c++/5.4.0')
  set path+=/usr/include/c++/5.4.0
endif

if isdirectory('/usr/include/c++/7')
  set path+=/usr/include/c++/7
endif

if isdirectory('/usr/include/c++/8')
  set path+=/usr/include/c++/8
endif

