#!/bin/bash

FILES=$(find . -maxdepth 2 -name \* -not -path "./.git/*" -not -path "./.git" -not -name ".config" -not -name ".vim" -not -path . -not -name ".*\/.*" -not -name "link.sh" -not -name "install_mac.sh" -not -name "install_arch.sh" -not -name "Brewfile" 2>/dev/null)

for filename in $FILES; do
  filepath=$(echo $filename | sed -e "s/\.\///" | sed -e "s/\n//")
  
  source=$(pwd)/$filepath
  dest=$HOME/$filepath
  
  $(unlink $dest &> /dev/null) || $(rm -rf $dest &> /dev/null)
  ln -sf $source $dest &&  echo "$dest -> $source"
done
