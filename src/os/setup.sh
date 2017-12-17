#!/bin/bash

declare skipQuestions=false

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

stage__copy_dotfiles() {

  # directories that are to be copied
  local dirs_to_copy=(
    "git"
    "shell"
    "vim"
    "tmux"
  )

  local files_to_copy=(

  )

  # where the files need to be copied to
  local target_dir="$HOME"
  local parent_dir=$(realpath "${current_dir}/../")

  for dir_to_copy in ${dirs_to_copy[*]}; do
    execute \
      "cp -rf '${parent_dir}/${dir_to_copy}/.' '${target_dir}'" \
      "Copying '${dir_to_copy}' contents to '${target_dir}'"
  done

  for file in ${files_to_copy[*]}; do
    execute \
      "cp -rf '${parent_dir}/${file}' '${target_dir}'" \
      "Copying '${file}' to '${target_dir}'"
  done

  unset file
  unset dir_to_copy

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

main() {

  # Ensure that the following actions
  # are made relative to this file"s path.
  declare current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
    . "$(realpath "${current_dir}/utils.sh")"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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

  execute_stage "Dotfiles" "Copy dotfiles?" stage__copy_dotfiles

  execute_stage "Packages" "Install packages?" stage__install_packages

  if [ -x "${current_dir}/sensible/main.sh" ]; then
    execute_stage "Sensible" "Run sensible script?" stage__run_sensible_script
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


  print_in_green "\nDone!\n"

}

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

main "$@"

unset -f stage__copy_dotfiles
unset -f stage__install_packages
unset -f stage__run_sensible_script
unset -f execute_stage
unset -f main
