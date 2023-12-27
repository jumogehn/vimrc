#####!/bin/bash
#####!/bin/zsh

if [ -e "$HOME/.vim/bundle/youcompleteme" ]; then
    cd $HOME/.vim/bundle/youcompleteme
    python3 install.py --clangd-completer
    echo "You are done for installing YCM!!"
else
    echo "Do :PluginInstall first"
fi

