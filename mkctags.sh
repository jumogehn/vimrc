#!/bin/sh

rm -rf tags

ctags --langmap=C++:+.inc+.def --c++-kinds=+p --fields=+iaS --extra=+fq --sort=foldcase -R .


