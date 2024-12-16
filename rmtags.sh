#!/bin/bash

if [ -e "tags" ]; then
  rm -f tags
fi
if [ -e "cscope.files" ]; then
  rm -f cscope.files
fi
if [ -e "cscope.out" ]; then
  rm -f cscope.out
fi
if [ -e "cscope.in.out" ]; then
  rm -f cscope.in.out
fi
if [ -e "cscope.po.out" ]; then
  rm -f cscope.po.out
fi
