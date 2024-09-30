pkgs: with pkgs; {
  packages = [
    cabal-install
    ghc
    haskell-language-server

    lua
    luarocks
    stylua
    lua-language-server

    nil
    nixfmt-rfc-style

    ocaml
    opam
    ocamlPackages.ocaml-lsp

    (python311.withPackages (
      ps: with ps; [
        isort
        python-lsp-ruff
        python-lsp-server
      ]
    ))

    rust-bin.stable.latest.default
    rust-analyzer
  ];
}
