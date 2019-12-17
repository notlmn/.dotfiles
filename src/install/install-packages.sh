#!/bin/bash

declare current_dir="$(dirname "${BASH_SOURCE[0]}")" && \
  source "$(readlink -f "${current_dir}/utils.sh")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

autoremove() {
  # Remove packages that were automatically installed to satisfy
  # dependencies for other packages and are no longer needed.

  execute \
    "sudo apt-get autoremove -qqy" \
    "APT (autoremove)"
}

install_package() {
  declare -r PACKAGE="$2"
  declare -r PACKAGE_READABLE_NAME="$1"

  if ! package_is_installed "$PACKAGE"; then
    execute "sudo apt-get install --allow-unauthenticated -qqy $PACKAGE" "$PACKAGE_READABLE_NAME"
    #                                      suppress output ─┘│
    #            assume "yes" as the answer to all prompts ──┘
  else
    print_success "$PACKAGE_READABLE_NAME"
  fi
}

package_is_installed() {
  dpkg -s "$1" &> "/dev/null"
}

update() {
  # Resynchronize the package index files from their sources.
  execute \
    "sudo apt-get update -qqy" \
    "APT (update)"
}

upgrade() {
  # Install the newest versions of all packages installed.
  execute \
    "sudo apt upgrade -qqy" \
    "APT (upgrade)"
}


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
  update
  upgrade

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Install tools for compiling/building software from source.
  install_package "Build Essential" "build-essential"
  install_package "cURL" "curl"
  install_package "Git" "git"
  install_package "ShellCheck" "shellcheck"
  install_package "tmux" "tmux"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  execute "curl -sL \"https://deb.nodesource.com/setup_13.x\" | sudo -E bash -" "Add NodeSource repo"

  install_package "Node.js" "nodejs"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  autoremove
}

main

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

unset -f autoremove
unset -f install_package
unset -f package_is_installed
unset -f update
unset -f upgrade
unset -f main
