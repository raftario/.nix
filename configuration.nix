{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
  environment.systemPackages = with pkgs; [
    curl
    git
    neovim
  ];
}
