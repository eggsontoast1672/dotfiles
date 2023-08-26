#!/bin/sh

# TODO: Add -d and -f options to install_config to control whether the target
# should be treated as a directory or a file respectively. Also, if ${2} is not
# empty, link the target into that directory instead of the default (.config).
install_config() {
  location=${HOME}/.config/${1}
  if [ -d ${location} ]
  then
    echo "Config for ${1} exists. Skipping..."
    return
  fi
  ln -sv $(readlink -f ${1}) ${location}
}

install_config helix
install_config kitty
install_config tmux