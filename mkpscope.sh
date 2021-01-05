#!/bin/bash

rm -rf cscope.files cscope.out

find `pwd` \( -name '*.php' \) -print > cscope.files

cscope -i cscope.files


