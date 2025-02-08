pkgs: with pkgs; {
  packages = [
    # cabal-install
    # ghc
    # haskell-language-server

    lua
    # luarocks
    stylua
    lua-language-server

    nil
    nixfmt-rfc-style

    # ocaml
    # opam
    # ocamlPackages.ocaml-lsp

    # python311
    pyright
    ruff
    # micromamba

    rust-bin.stable.latest.default
    rust-analyzer
  ];
}
