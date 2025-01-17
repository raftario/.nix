{nixpkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = nixpkgs.unstable.ghostty;

    settings = {
      font-family = "Berkeley Mono Variable";
      font-size = 16;
      font-style-bold = "Bold";
      font-style-italic = "Oblique";
      font-style-bold-italic = "Bold Oblique";

      window-decoration = false;
    };
  };

  catppuccin.ghostty.enable = true;
}
