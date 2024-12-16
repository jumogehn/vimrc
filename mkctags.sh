#!/bin/bash

rm -f tags

# --langmap=C++:+.inc+.def  << file extensions and language mappings can be
# added like this

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    echo "No file names provided. File names are searched"
    ctags --c++-kinds=+p --fields=+iaS --extra=+fq --language-force=C++ \
        --sort=foldcase --links=no -R .
else
    echo "File names provided:"
    for arg in "$@"; do
        echo "$arg"
    done
    ctags --c++-kinds=+p --fields=+iaS --extra=+fq --language-force=C++ \
        --sort=foldcase --links=no $*
fi

