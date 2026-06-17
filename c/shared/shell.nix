with import <nixpkgs> {};
runCommand "shared" {
    buildInputs = [
      gcc
      gdb
      binutils
      gnumake
    ];
} ""
