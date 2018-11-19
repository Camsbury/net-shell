{ nixpkgsFn ? import ./nixpkgs.nix }:

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
      pillow
      h5py
      # tensorflow
      tensorflowWithCuda
    ];
  }
