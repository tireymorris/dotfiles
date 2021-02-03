#!/bin/zsh

### clean up
rm -rf ~/.vim  ~/bin ~/.nvm ~/.rustup ~/.cargo ~/.npm &> /dev/null

set -e

### xcode tools
xcode-select --install || echo "Xcode already installed."

### install homebrew and restore from backup
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file ~/.dotfiles/Brewfile

### use zsh
chsh -s /bin/zsh
sudo sh -c 'echo /opt/local/bin/zsh >>/etc/shells'

### install startup page
mkdir -p $HOME/bin
cd $HOME/bin
git clone https://github.com/tireymorris/startpage

### lolcate, spotify-tui
rustup-init
/Users/$USER/.cargo/bin/rustup toolchain install nightly
/Users/$USER/.cargo/bin/cargo install lolcate-rs

### npm & packages
. "/usr/local/opt/nvm/nvm.sh"
nvm install lts/fermium
npm i -g yarn http-server gen-secret netlify-cli

### vundle
mkdir -p $HOME/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
