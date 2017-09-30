#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  # ' At first you're like "shellcheck is awesome" but then you're
  #   like "wtf are we still using bash" '.
  #
  #  (from: https://twitter.com/astarasikov/status/568825996532707330)

  find \
    ./ \
    -type f \
    ! -path './git/*' \
    ! -path './vim/*' \
    ! -path './media/*' \
    ! -path './sensible/*' \
    ! -path './.dircolors' \
    ! -path './shell/.inpurtc' \
    ! -path './.gitignore' \
    ! -path './README.md' \
    ! -path './LICENSE' \
    ! -path './tmux/*' \
    ! -path './.git/*' \
    -exec shellcheck \
      -e SC1090 \
      -e SC1091 \
      -e SC2155 \
      -e SC2164 \
    {} +

  echo "'$?'" "Ran code through ShellCheck"

}

main

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

unset -f main
