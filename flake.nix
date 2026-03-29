{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cornelis = {
      url = "github:agda/cornelis";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
    rust-overlay,
    cornelis,
  }:
  flake-utils.lib.eachDefaultSystem (
    system:
    let
      overlays = [ (import rust-overlay) ];
      pkgs = import nixpkgs { inherit system overlays; };
    in
    with pkgs;
    {
      devShells.default = mkShell {
        packages = [
	  bashInteractive
	] ++ [
	  neovim
	  helix
	] ++ [
	  bat
	  eza
          direnv
	  fd
	  git
	  gnumake
	  jujutsu
          protobuf
	  ripgrep
	  tmux
          tree-sitter
	  zellij
	] ++ [
          cornelis.packages.${system}.cornelis
          cornelis.packages.${system}

	  python313
          ruff
          ty
	  uv
          
          stack
          ghc

          lean4
          
          lua
          luarocks
          stylua
          lua-language-server

	  nil
	  nixfmt

	  ocaml
          ocamlPackages.ocaml-lsp
	  opam
          # tree-sitter-grammars.tree-sitter-ocaml

	  rust-bin.stable.latest.default
	  rust-analyzer
          
          # stack
          # haskell.compiler.ghc9103
	];
	shellHook =
	''
	export SHELL=${bashInteractive}/bin/bash

	alias cat=bat
	alias find=fd
	alias ls=eza
	alias grep=rg
	'';
      };
    }
  );
}
