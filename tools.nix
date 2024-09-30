pkgs: with pkgs; {
  packages = [
    git
    starship
    neovim
    tmux
    zellij
  ];

  shellHook = ''
    # eval "$(starship init bash)"
  '';
}
