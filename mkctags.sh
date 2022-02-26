#!/bin/bash

rm -rf tags

# --langmap=C++:+.inc+.def  << file extensions and language mappings can be
# added like this

ctags --c++-kinds=+p --fields=+iaS --extra=+fq --language-force=C++ \
  --sort=foldcase --links=no -R .

