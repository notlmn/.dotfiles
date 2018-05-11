#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Create new directories and enter the first one.

mkd() {
  if [ -n "$*" ]; then
    mkdir -p "$@"
    #      └─ make parent directories if needed

    cd "$@" || exit 1
  fi
}
