{nixpkgs, ...}: {
  home.packages = with nixpkgs.unstable; [
    vesktop
  ];
}
