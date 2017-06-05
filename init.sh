#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "./install/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

copy_required_files() {
  printf "\n%s" "• Copying dotfiles..."

  # directories that are to be copied
  local dirs_to_copy=(
    "git"
    "shell"
    "vim"
    "tmux"
  )

  local files_to_copy=(
    ".dircolors"
  )

  # where the files need to be copied to
  local target_dir="$HOME"

  for dir_to_copy in ${dirs_to_copy[*]}; do
    local files=( "$( find "$dir_to_copy" | tr "" "" | tr "\n" " " )" )

    execute "cp -rf '${dir_to_copy}/.' ${target_dir}" "Copying '${dir_to_copy}' contents to '${target_dir}'"
  done

  for file in ${files_to_copy[*]}; do
    execute "cp -rf ${file} ${target_dir}" "Copying '${file}' to '${target_dir}'"
  done

  unset file
  unset dir_to_copy
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

doIt() {
  copy_required_files

  sudo ./install/main.sh

  if [ -x ./sensible/init.sh ]; then
    printf "\n%s" "• Running sensibles..."
    source ./sensible/init.sh
  fi

  printf "\n%s" "You're good to go!"
}

print_in_color "          __      __  _____ __            \n" 1
print_in_color "     ____/ /___  / /_/ __(_) /__  _____   \n" 2
print_in_color "    / __  / __ \/ __/ /_/ / / _ \/ ___/   \n" 3
print_in_color "   / /_/ / /_/ / /_/ __/ / /  __(__  )    \n" 5
print_in_color "   \__,_/\____/\__/_/ /_/_/\___/____/     \n" 6

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt
else

  printf "\n%s\n" "• Initializing..."
  ask_for_confirmation "This may overwrite existing files. Continue?"
  if answer_is_yes; then
    doIt
  else
    printf "\n%s\n" "• Quitting..."
  fi

fi

unset -f copy_required_files
unset -f doIt
