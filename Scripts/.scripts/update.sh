#!/usr/bin/bash

yay -Syu --devel

cd $HOME/repos/eww/
git pull origin master
cargo build --release --no-default-features --features=wayland
cd ~
