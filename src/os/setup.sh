#!/bin/bash

declare current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
    . "$(readlink -f "${current_dir}/utils.sh")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare skipQuestions=false

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

stage__symlink_dotfiles() {

  . "${current_dir}/create_symbolic_links.sh"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

stage__install_packages() {

  . "${current_dir}/install/main.sh"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

stage__run_sensible_script() {

  . "${current_dir}/sensible/main.sh"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

stage__instantiate_submodules() {

  execute "git submodule init" "Inializing Git submodules"
  execute "git submodule update" "Updating Git submodules"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute_stage() {

  local stage=$1
  local question=$2
  local func=$3

  printf "\n%s\n" "• Stage: '$stage'"

  if $skipQuestions; then
    $func
  else

    ask_for_confirmation "$question"

    if answer_is_yes; then
      $func
    else
      print_in_yellow "  [!] Skipping \"$stage\"\n"
    fi

  fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  print_in_color "          __      __  _____ __            \n" 1
  print_in_color "     ____/ /___  / /_/ __(_) /__  _____   \n" 2
  print_in_color "    / __  / __ \/ __/ /_/ / / _ \/ ___/   \n" 3
  print_in_color "   / /_/ / /_/ / /_/ __/ / /  __(__  )    \n" 5
  print_in_color "   \__,_/\____/\__/_/ /_/_/\___/____/     \n" 6
  printf "\n"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  skip_questions "$@" \
    && skipQuestions=true

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ask_for_sudo

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute_stage "Dotfiles" "Symlink dotfiles?" stage__symlink_dotfiles

  execute_stage "Submodules" "Instantiate submodules?" stage__instantiate_submodules

  execute_stage "Packages" "Install packages?" stage__install_packages

  if [ -x "${current_dir}/sensible/main.sh" ]; then
    execute_stage "Sensible" "Run sensible script?" stage__run_sensible_script
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


  print_in_green "\nDone!\n"

}

main "$@"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

unset -f stage__symlink_dotfiles
unset -f stage__install_packages
unset -f stage__run_sensible_script
unset -f stage__instantiate_submodules
unset -f execute_stage
unset -f main
