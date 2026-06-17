with import <nixpkgs> {};
runCommand "functional" {
    buildInputs = [
      gcc
      gdb
      binutils
      gnumake
    ];
} ""
