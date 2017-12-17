#!/bin/bash

declare current_dir="$(dirname "${BASH_SOURCE[0]}")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  . "${current_dir}/run_shellcheck.sh"

  exit "$?"

}

main
