#!/bin/bash

CURRENT_PATH=$(pwd)

# tmux
ln -s $CURRENT_PATH/tmux.conf $HOME/.tmux.conf
echo -e alias tmux=\'tmux -2\' >> ~/.bash_aliases
