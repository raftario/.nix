{nixpkgs, ...}: {
  home.packages = with nixpkgs.unstable; [
    spotify
  ];
}
