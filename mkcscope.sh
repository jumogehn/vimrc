#!/bin/bash

rm -rf cscope.files cscope.out

find `pwd` \( -name '*.c' -o \
  -name '*.cpp' -o \
  -name '*.cc' -o \
  -name '*.h' -o \
  -name '*.hpp' ! -type l \) -print > cscope.files

cscope -i cscope.files

