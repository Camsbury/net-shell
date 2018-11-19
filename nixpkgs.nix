let
  nixpkgs = import (fetchTarball
    https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz);
in nixpkgs
