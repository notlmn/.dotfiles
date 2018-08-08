#!/bin/bash

[ -n "$PS1" ] && . "$HOME/.bash_profile"

if command -v tmux &> '/dev/null'; then
  exec tmux
fi
