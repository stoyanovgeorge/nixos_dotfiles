#!/bin/sh


pushd "$HOME"/.dotfiles/ || exit
sudo nixos-rebuild switch -I nixos-config=./system/configuration.nix
popd || exit
