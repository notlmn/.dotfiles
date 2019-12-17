#!/bin/bash

declare current_dir="$(dirname "${BASH_SOURCE[0]}")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
  source "${current_dir}/run_shellcheck.sh"

  exit "$?"
}

main

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

unset -f main
