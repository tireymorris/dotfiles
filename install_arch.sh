#!/bin/bash

function install_all {
  paru -S --needed - ./Pacfile
  . "$HOME/.nvm/nvm.sh"
  nvm install lts/fermium
  npm i -g yarn http-server gen-secret netlify-cli
  rustup toolchain install nightly
  cargo install lolcate-rs spotify-tui exa bat fd-find ripgrep procs tokei mdcat
}

function clean {
  sudo pacman -D --asdeps $(pacman -Qqe)
  sudo pacman -D --asexplicit - ./Pacfile
  sudo pacman -Rns $(pacman -Qttdq)
  sudo pacman -Scc
}
