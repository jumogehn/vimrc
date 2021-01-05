#!/bin/bash

rm -rf cscope.files cscope.out

find `pwd` \( -name '*.c' -o -name '*.cpp' -o -name '*.cc' -o -name '*.h' -o -name '*.hpp' -o -name '*.java' -o -name '*.s' -o -name '*.S' -o -name '*.inc' -o -name '*.def' \) -print > cscope.files

cscope -i cscope.files



