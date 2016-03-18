#!/bin/bash

CURRENT_PATH=$(pwd)

# tmux
ln -s $CURRENT_PATH/tmux.conf $HOME/.tmux.conf
echo -e alias tmux=\'tmux -2\' >> ~/.bash_aliases

# bashrc
ln -s -f $CURRENT_PATH/.bashrc $HOME/.bashrc

# zsh
ln -s -f $CURRENT_PATH/.zshrc $HOME/.zshrc

# Git log alias
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
