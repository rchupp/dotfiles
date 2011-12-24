#!/bin/bash

# make sure that tmux is launched in 256 color mode
alias tmux="TERM=xterm-256color tmux"

# load tmuxinator if installed
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && . $HOME/.tmuxinator/scripts/tmuxinator