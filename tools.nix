pkgs: with pkgs; {
  packages = [
    bat
    eza
    fd
    git
    gnumake
    ripgrep
    starship
    tmux
    zellij
  ];

  shellHook = ''
    # eval "$(starship init bash)"
    alias cat=bat
    alias find=fd
    alias ls=eza
    alias grep=rg
  '';
}
