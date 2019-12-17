#!/bin/bash

declare current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
  source "$(readlink -f "${current_dir}/utils.sh")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_symlinks() {
  declare -a FILES_TO_SYMLINK=(
    "git/.gitattributes"
    "git/.gitconfig"
    "git/.gitignore"

    "shell/.bash_aliases"
    "shell/.bash_autocomplete"
    "shell/.bash_colors"
    "shell/.bash_exports"
    "shell/.bash_functions"
    "shell/.bash_logout"
    "shell/.bash_options"
    "shell/.bash_profile"
    "shell/.bash_prompt"
    "shell/.bashrc"
    "shell/.inputrc"

    "tmux/.tmux.conf"

    "vim/.vim"
    "vim/.vimrc"
  )

  local i=""
  local sourceFile=""
  local targetFile=""

  for i in "${FILES_TO_SYMLINK[@]}"; do
    sourceFile="$(cd "$current_dir" && cd .. && pwd)/$i"
    targetFile="$HOME/$(printf "%s" "$i" | sed "s/^\([^\/]*\/\)//g")"

    execute \
      "ln -fs $sourceFile $targetFile" \
      "$targetFile → $sourceFile"
  done
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
  create_symlinks "$@"
}

main "$@"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

unset -f create_symlinks
unset -f main
