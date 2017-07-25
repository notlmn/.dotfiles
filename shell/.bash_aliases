#!/bin/bash

alias ..="cd .."                  # ┐
alias ...="cd ../.."              # │ Easier navigation through
alias ....="cd ../../.."          # │ directories
alias cd..="cd .."                # ┘

alias c="clear"
alias ch="history -c && > ~/.bash_history"
alias e="vim --"
alias g="git"
alias ll="ls -AlF"
alias m="man"
alias n="npm"
alias q="exit"
alias rm="rm -rf --"
alias t="tmux"

# Quickly change to Windows profile (assuming same username)
alias win="cd /mnt/c/Users/$(whoami)"

# Reload shell
alias reload='exec $SHELL -l'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Stopwatch
alias timer='echo "Stop with Ctrl+D" && date && time cat && date'
