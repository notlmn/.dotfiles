#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && source "../src/os/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  # ' At first you're like "shellcheck is awesome" but then you're
  #   like "wtf are we still using bash" '.
  #
  #  (from: https://twitter.com/astarasikov/status/568825996532707330)

  find \
    '../src/os' \
    '../src/shell' \
    '../test' \
    -type f \
    ! -path '../src/os/sensible/*' \
    ! -path '../src/shell/inputrc' \
    -exec shellcheck \
      -e SC1090 \
      -e SC1091 \
      -e SC2155 \
      -e SC2164 \
    {} +

  print_result "$?" "Ran code through ShellCheck"

}

main

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

unset -f main
