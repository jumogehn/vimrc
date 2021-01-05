#!/bin/bash

if [ -e "tags" ]; then
  rm -rf tags
fi
if [ -e "cscope.files" ]; then
  rm -rf cscope.files
fi
if [ -e "cscope.out" ]; then
  rm -rf cscope.out
fi

