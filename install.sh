#!/bin/zsh

ALL=(
  adobe-source-code-pro-fonts
  alsa-firmware
  alsa-utils
  arandr
  arch-wiki-docs
  archlinux-wallpaper
  asdf-vm
  autocutsel
  autojump-rs
  base
  bat
  bdf-unifont
  blueberry
  browsh-bin
  calibre
  chromium
  cronie
  cups
  cups-pdf
  curl
  deluge
  deluge-gtk
  desktop-file-utils
  dhcpcd
  dialog
  dnsutils
  docker
  docker-compose
  dosfstools
  epdfview
  equilux-theme
  exa
  fail2ban
  fakeroot
  fd
  feh
  filelight
  git
  github-cli
  glances
  go
  gtk3
  gucharmap
  gyazo
  htop
  i3-gaps
  i3lock
  icu
  iwd
  jdk11-openjdk
  libsecret
  liburcu
  libvirt
  libxfont2
  light
  lxappearance-gtk3
  man-db
  mdcat
  mosh
  neofetch
  neovim
  nerd-fonts-fira-code
  nerd-fonts-hack
  nerd-fonts-source-code-pro
  net-tools
  netctl
  nmap
  noto-fonts
  noto-fonts-emoji
  noto-fonts-extra
  ntfsprogs
  nvm
  openssh
  openssl-1.0
  p7zip
  papirus-icon-theme
  parcellite
  paru-bin
  paru-bin
  pavucontrol
  plank
  playerctl
  powerline-fonts
  procs
  pulseaudio
  pulseaudio-alsa
  pulseaudio-bluetooth
  python
  python-pip
  python-pynvim
  python2
  redshift
  ripgrep
  ristretto
  rofi
  rustup
  speedtest-cli
  sudo
  system-config-printer
  telegram-desktop
  terminus-font
  termsyn-font
  thefuck
  thunar
  tlp
  tokei
  ttf-dejavu
  ttf-font-awesome-4
  ttf-liberation
  ttf-mac-fonts
  ttf-symbola
  ttf-ubuntu-font-family
  udisks2
  unicode-emoji
  unzip
  upower
  vim
  vim-runtime
  visual-studio-code-bin
  vlc
  wget
  whois
  wireguard-tools
  wpa_supplicant
  xfce4-terminal
  xorg-server
  xorg-xinit
  xorg-xkill
  youtube-dl
  zip
  zlib
  zsh
)

function install_all {
  paru -S --needed $ALL
  # paru -Q $ALL
  . "/usr/share/nvm/nvm.sh"
  mkdir -p $HOME/.config $HOME/.vim/bundle
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  nvm install lts/fermium
  npm i -g yarn http-server gen-secret netlify-cli npm-run-all
  rustup toolchain install nightly
  cargo install spotify-tui starship du-dust
}

function clean {
  sudo pacman -D --asdeps $(pacman -Qqe)
  sudo pacman -D --asexplicit $ALL
  sudo pacman -Rns $(pacman -Qttdq)
  sudo pacman -Scc
}

install_all
