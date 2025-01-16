{nixpkgs, ...}: {
  security.polkit.enable = true;
  security.rtkit.enable = true;

  programs._1password = {
    enable = true;
    package = nixpkgs.unstable._1password-cli;
  };

  programs._1password-gui = {
    enable = true;
    package = nixpkgs.unstable._1password-gui;
  };
}
