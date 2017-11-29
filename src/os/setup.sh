#!/bin/bash

declare skipQuestions=false

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

copy_required_files() {

  printf "\n%s\n" "• Copying dotfiles..."

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

  for dir_to_copy in ${dirs_to_copy[*]}; do
    execute \
      "cp -rf \"../${dir_to_copy}/.\" \"${target_dir}\"" \
      "Copying \"${dir_to_copy}\" contents to \"${target_dir}\""
  done

  for file in ${files_to_copy[*]}; do
    execute \
      "cp -rf \"../${file}\" \"${target_dir}\"" \
      "Copying \"${file}\" to \"${target_dir}\""
  done

  unset file
  unset dir_to_copy

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

doIt() {

  copy_required_files

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  . "./install/main.sh"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if [ -x "./sensible/main.sh" ]; then
    printf "\n%s\n" "• Running sensibles..."
    . "./sensible/main.sh"
  fi

  print_in_green "\n• You're good to go!\n"

}


main() {

  # Ensure that the following actions
  # are made relative to this file"s path.
  cd "$(dirname "${BASH_SOURCE[0]}")" \
    || exit 1

  . './utils.sh'

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  print_in_color "          __      __  _____ __            \n" 1
  print_in_color "     ____/ /___  / /_/ __(_) /__  _____   \n" 2
  print_in_color "    / __  / __ \/ __/ /_/ / / _ \/ ___/   \n" 3
  print_in_color "   / /_/ / /_/ / /_/ __/ / /  __(__  )    \n" 5
  print_in_color "   \__,_/\____/\__/_/ /_/_/\___/____/     \n" 6

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  skip_questions "$@" \
    && skipQuestions=true

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ask_for_sudo

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  if $skipQuestions; then
    doIt
  else

    printf "\n%s\n" "• Initializing..."
    ask_for_confirmation "Are you sure?"

    if answer_is_yes; then
      doIt
    else
      print_in_red "\n• Quitting\n"
      exit 1
    fi

  fi

}

main "$@"

unset -f copy_required_files
unset -f doIt
unset -f main
