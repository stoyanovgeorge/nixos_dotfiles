#!/bin/sh


pushd "$HOME"/.dotfiles/ || exit
home-manager switch -f ./users/gstoyanov/home.nix
popd || exit
