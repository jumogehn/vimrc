#!/bin/bash

rm -rf tags

ctags --langmap=C++:+.inc+.def --c++-kinds=+p --fields=+iaS --sort=foldcase -R .


