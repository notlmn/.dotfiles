#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
  && . "./utils.sh"

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
  dpkg -s "$1" &> /dev/null
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
    "export DEBIAN_FRONTEND=\"noninteractive\" \
      && sudo apt-get -o Dpkg::Options::=\"--force-confnew\" upgrade -qqy" \
    "APT (upgrade)"

}


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

  echo -e "\n• Installing packages..."

  ask_for_confirmation "Do you want to install packages?"
  if ! answer_is_yes; then
    return
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  update
  upgrade

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  # Install tools for compiling/building software from source.
  install_package "Build Essential" "build-essential"

  # GnuPG archive keys of the Debian archive.
  install_package "GnuPG archive keys" "debian-archive-keyring"

  install_package "Git" "git"

  install_package "ImageMagick" "imagemagick"

  install_package "FFmpeg" "ffmpeg"
  install_package "cURL" "curl"
  install_package "ShellCheck" "shellcheck"

  install_package "tmux" "tmux"

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  ask_for_confirmation "Do you want to install NodeJS?"
  if answer_is_yes; then
    execute "(curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -) && \
      (sudo apt-get install nodejs)" "NodeJS"
  fi

  # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
  autoremove
}

main

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

unset -f main
