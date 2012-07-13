#!/bin/sh

rm -rf tags

ctags -R --langmap=C++:.inc --c++-kinds=+p --fields=+iaS --extra=+q

