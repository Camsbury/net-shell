{ nixpkgsFn ? import <nixpkgs> }:

let
  nixpkgs = nixpkgsFn {
    config = {
      allowUnfree = true;
    };
  };
in
  with nixpkgs;
  stdenv.mkDerivation rec {
    name = "net-shell";
    env = buildEnv { name = name; paths = buildInputs; };
    buildInputs = with python3Packages; [
      python3
      ipython
      Keras
      tensorflow
      # tensorflowWithCuda
      # Need to figure out how to get the right version going - (unstable)
    ];
  }
