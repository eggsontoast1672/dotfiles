#!/bin/sh

echo "Installing vim-plug..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [ ! -d ~/.config/nvim ]; then
  echo "Creating config directory..."
  mkdir -p ~/.config/nvim
else
  echo "Config directory exists; skipping..."
fi

if [ ! -z "$(ls -A ~/.config/nvim)" ]; then
  echo "Removing existing files..."
  rm -rf ~/.config/nvim/*
else
  echo "Config directory is clean; skipping..."
fi

echo "Copying files..."
cp init.vim ~/.config/nvim/init.vim

echo
echo "Done!"
echo "Make sure to run :PlugInstall to get rid of errors."
