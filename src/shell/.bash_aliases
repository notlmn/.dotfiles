#!/bin/bash

alias ch="history -c > ~/.bash_history"
alias ll="ls -AlF"
alias q="exit"
alias rm="rm -rf --"

# Reload shell
alias reload='exec $SHELL -l'

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'

# Stopwatch
alias timer='echo "Stop with Ctrl+D" && date && time cat && date'
