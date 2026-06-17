with import <nixpkgs> {};
runCommand "demo" {
    buildInputs = [
      gcc
      gdb
      binutils
      gnumake
    ];
} ""
