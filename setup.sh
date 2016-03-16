#!/bin/bash

CURRENT_PATH=$(pwd)

# tmux
[ -f ~/.tmux.conf ] || [ -h ~/.tmux.conf ] || ln -s $CURRENT_PATH/tmux.conf ~/.tmux.conf
grep tmux ~/.bash_aliases > /dev/null 2>&1 || echo -e alias tmux=\'tmux -2\' >> ~/.bash_aliases

# bashrc
[ -f ~/.bashrc ] || [ -h ~/.bashrc ] || ln -s $CURRENT_PATH/.bashrc ~/.bashrc

# zsh
[ -f ~/.zshrc ] || [ -h ~/.zshrc ] || ln -s $CURRENT_PATH/.zshrc ~/.zshrc

# tmux plugin manager
[ -d ~/.tmux/plugins/tpm ] || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# openbox configuration
[ -d ~/.config/openbox ] || [ -h ~/.config/openbox ] || (cd ~/.config && ln -s $CURRENT_PATH/.config/openbox)

