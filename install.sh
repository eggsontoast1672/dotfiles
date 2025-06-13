#!/bin/sh

working_dir=$(pwd)

install_config() {
  if [ -e "${2}" ]; then
    echo "-- Config '${2}' exists, skipping..."
  else
    echo "-- Installing ${1} to ${2}..."
    ln -s "${working_dir}/${1}" "${2}"
  fi
}

install_config alacritty "${HOME}/.config/alacritty"
install_config nvim "${HOME}/.config/nvim"

echo "-- Done!"
