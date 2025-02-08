{ pkgs }:
with pkgs;
let
  languages = import ./languages.nix pkgs;
  tools = import ./tools.nix pkgs;
in
mkShell {
  packages =
    [
      bashInteractive
    ]
    ++ languages.packages
    ++ tools.packages;

  shellHook =
    ''
      export SHELL=${bashInteractive}/bin/bash
    ''
    + tools.shellHook;
}
