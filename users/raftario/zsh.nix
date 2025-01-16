{
  nixpkgs,
  hostname,
  ...
}: {
  programs.zsh = {
    enable = true;

    history = {
      append = true;
      size = 64 * 1024;
      expireDuplicatesFirst = true;
      extended = true;
    };

    oh-my-zsh = {
      enable = true;
      plugins = [
        "1password"
        "docker"
        "docker-compose"
        "fzf"
        "gh"
        "rust"
        "ssh"
        "starship"
        "tailscale"
        "zoxide"
      ];
    };

    shellAliases = {
      cat = "bat";
      cd = "z";
      grep = "rg";
      ls = "lsd";
      rebuild = "nixos-rebuild switch --flake path:/etc/nixos#${hostname}";
    };

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
  };

  programs.starship = {
    enable = true;
  };

  programs.fzf.enable = true;
  programs.zoxide.enable = true;

  home.packages = with nixpkgs.stable; [
    bat
    lsd
    ripgrep
  ];

  catppuccin = {
    bat.enable = true;
    delta.enable = true;
    fzf.enable = true;
    lsd.enable = true;
    starship.enable = true;
    zsh-syntax-highlighting.enable = true;
  };
}
