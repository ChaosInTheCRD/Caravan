#!/bin/bash

# install Nix
curl -L https://nixos.org/nix/install | sh

# set environment variables
. ${HOME}/.nix-profile/etc/profile.d/nix.sh

# check that nix installed correctly
if nix-env --list-generations; then
  echo "Nix is installed correctly! continuing..."
else
  echo "Nix failed to install correctly, exiting..."
  exit 1;
fi

# setup home-manager (I would like to get this declared in Nix... but currently don't know how.)
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
nix-shell '<home-manager>' -A install

# remove the default config
rm ~/.config/nixpkgs/home.nix

# clone this repo into the repository
git clone https://github.com/chaosinthecrd/caravan.git ~/.config/nixpkgs --depth 1

# perform home-manager switch
home-manager switch

echo "Welcome to the Caravan!"
sleep 2
