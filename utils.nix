pkgs: with pkgs; {
  packages = [
    bat
    eza
    fd
    ripgrep
  ];

  shellHook = ''
    alias cat=bat
    alias find=fd
    alias ls=eza
    alias grep=rg
  '';
}
