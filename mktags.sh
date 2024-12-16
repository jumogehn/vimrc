#!/bin/bash

rm -f cscope.files cscope.out cscope.in.out cscope.po.out
rm -f tags

# In the ctags,
# --langmap=C++:+.inc+.def  << file extensions and language mappings can be
# added like this

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    echo "No file names provided. File names are searched"
    find `pwd` \( -name '*.c' -o \
        -name '*.cpp' -o \
        -name '*.cc' -o \
        -name '*.h' -o \
        -name '*.hpp' ! -type l \) -print > cscope.files
    cscope -b -q -k -i cscope.files
    ctags --c++-kinds=+p --fields=+iaS --extra=+fq --language-force=C++ \
        --sort=foldcase --links=no -L cscope.files
else
    echo "File names provided:"
    for arg in "$@"; do
        echo "$arg"
    done
    cscope -b -q -k $*
    ctags --c++-kinds=+p --fields=+iaS --extra=+fq --language-force=C++ \
        --sort=foldcase --links=no $*
fi

