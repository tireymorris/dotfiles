#!/bin/bash
ALL=(
  alacritty
  alsa-firmware
  alsa-utils
  arandr
  archlinux-wallpaper
  autocutsel
  base
  base-devel
  bdf-unifont
  cronie
  curl
  dhcpcd
  dialog
  dunst
  fakeroot
  git
  glances
  gtk3
  htop
  i3-gaps
  icu
  iwd
  libsecret
  liburcu
  libvirt
  libxfont2
  light
  linux
  linux-firmware
  linux-headers
  man-db
  neofetch
  neovim
  neovim
  net-tools
  netctl
  nmap
  nmap
  ntfsprogs
  openssh
  openssl-1.0
  p7zip
  papirus-icon-theme
  parcellite
  pavucontrol
  pulseaudio
  pulseaudio-alsa
  pulseaudio-bluetooth
  python
  python
  python-pip
  python2
  qt5-base
  qt5-base
  redshift
  reflector
  ristretto
  rustup
  sddm
  speedtest-cli
  sudo
  thunar
  tlp
  tumbler
  udisks2
  unicode-emoji
  unzip
  upower
  vim
  vim-runtime
  wget
  wpa_supplicant
  xorg-server
  xorg-xinit
  xorg-xkill
  zip
  zlib
  zsh
  1password-bin
  adobe-source-code-pro-fonts
  arch-wiki-docs
  autojump
  blueberry
  brother-hll2350dw
  browsh-bin
  chicago95-gtk-theme-git
  chicago95-icon-theme-git
  chicago95-sddm-theme-git
  cups
  cups-pdf
  deluge
  deluge-gtk
  desktop-file-utils
  discord
  dnsutils
  docker
  docker-compose
  dosfstools
  dotnet-runtime
  dust-bin
  epdfview
  equilux-theme
  fail2ban
  feh
  filelight
  github-cli
  go
  google-chrome
  godot-bin
  gradle
  gucharmap
  gyazo
  heroku-cli-bin
  i3lock-fancy-git
  jdk11-openjdk
  jdk8-openjdk
  lolcate
  lxappearance-gtk3
  mcos-mjv-xfce-edition
  mongodb-bin
  mosh
  mullvad-vpn-bin
  nerd-fonts-fira-code
  nerd-fonts-hack
  nerd-fonts-source-code-pro
  noto-fonts
  noto-fonts-emoji
  noto-fonts-extra
  nvidia
  nvidia-settings
  nvtop
  obinskit
  openrazer-meta
  paman
  paru-bin
  picom-ibhagwan-git
  plank
  playerctl
  polybar
  polychromatic
  powerline-fonts
  python-neovim
  qdirstat
  qt5-quickcontrols
  rbenv
  redis
  rofi
  ruby-build
  sddm-theme-redrock
  signal-desktop
  siji-git
  slack-desktop
  snapd
  spotify
  starship-bin
  steam
  superpaper
  system-config-printer
  telegram-desktop
  terminus-font
  termsyn-font
  thefuck
  ttf-dejavu
  ttf-font-awesome-4
  ttf-liberation
  ttf-mac-fonts
  ttf-symbola
  ttf-ubuntu-font-family
  vagrant
  virtualbox
  virtualbox-host-modules-arch
  visual-studio-code-bin
  vlc
  whois
  wireguard-tools
  xcursor-chicago95-git
  xfce4
  xfce4-goodies
  xts-macos-theme
  xts-windows10-theme
  xts-windowsxp-theme
  youtube-dl
  zafiro-icon-theme
  zoom
)

function install_all {
  paru -S --needed $ALL
  . "$HOME/.nvm/nvm.sh"
  nvm install lts/fermium
  npm i -g yarn http-server gen-secret netlify-cli
  rustup toolchain install nightly
  cargo install lolcate-rs spotify-tui exa bat fd-find ripgrep procs tokei mdcat
}

function clean {
  sudo pacman -D --asdeps $(pacman -Qqe)
  sudo pacman -D --asexplicit $ALL
  sudo pacman -Rns $(pacman -Qttdq)
  sudo pacman -Scc
}