{ pkgs }:
with pkgs;
let
  c = import ./c.nix pkgs;
  languages = import ./languages.nix pkgs;
  tools = import ./tools.nix pkgs;
  utils = import ./utils.nix pkgs;
in
mkShell {
  packages = [
    bashInteractive
  ] ++ c.packages ++ languages.packages ++ tools.packages ++ utils.packages;

  shellHook =
    ''
      export SHELL=${bashInteractive}/bin/bash
    ''
    + utils.shellHook;
}
