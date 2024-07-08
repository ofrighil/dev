{
  description = "My portable environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
    rust-overlay = {
        url = "github:oxalica/rust-overlay";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, flake-utils, rust-overlay }:
    flake-utils.lib.eachDefaultSystem (
      system:
        let
          overlays = [ (import rust-overlay) ];
          pkgs = import nixpkgs { inherit system overlays; };
        in {
          devShells.default = with pkgs; let
            languages = [
              clang clang-tools cmake gcc gnumake lld

              lua luarocks stylua lua-language-server

              nil

              ocaml opam ocamlPackages.ocaml-lsp

              rust-bin.stable.latest.default rust-analyzer
            ];

            tools = [
              bashInteractive
              bat
              eza
              fd
              git
              ripgrep
              starship
              neovim
              tmux
            ];
          in mkShell {
            packages = languages ++ tools;

            shellHook = ''
              export SHELL=${bashInteractive}/bin/bash
              alias cat=bat
              alias find=fd
              alias ls=eza
              alias grep=rg
              # eval "$(starship init bash)"
            '';
	  };
        }
    );
}
