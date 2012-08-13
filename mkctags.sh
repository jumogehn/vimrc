#!/bin/sh

rm -rf tags

ctags --langmap=C++:+.inc --c++-kinds=+p --fields=+iaS --extra=+fq --sort=foldcase -R .


