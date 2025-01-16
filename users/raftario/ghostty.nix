{nixpkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = nixpkgs.unstable.ghostty;

    settings = {
      window-decoration = false;
    };
  };

  catppuccin.ghostty.enable = true;
}
