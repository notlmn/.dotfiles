#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

source_bash_files() {

  declare -r CURRENT_DIRECTORY="$(pwd)"

  declare -r -a FILES_TO_SOURCE=(
    "bash_aliases"
    "bash_autocomplete"
    "bash_exports"
    "bash_functions"
    "bash_options"
    "bash_prompt"
    "bash.local"  # For local settings that should
                  # not be under version control.
  )

  local file=""
  local i=""

  for i in ${!FILES_TO_SOURCE[*]}; do

      file="$HOME/.${FILES_TO_SOURCE[$i]}"

      [ -r "$file" ] && . "$file"

  done

  cd "$CURRENT_DIRECTORY"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

source_bash_files
unset -f source_bash_files

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Change default shell to tmux
if [[ -x "$(command -v tmux)" ]]; then

  # Additional check to not run tmux within itself
  #
  # https://unix.stackexchange.com/a/113768
  [[ "$TERM" != "screen" ]] && [ -z "$TMUX" ] && exec tmux

fi
