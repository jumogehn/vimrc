#!/bin/sh

rm -rf tags

ctags --langmap=C++:.inc --c++-kinds=+p --fields=+iaS --extra=+q --sort=foldcase -R .

