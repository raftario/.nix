{nixpkgs, ...}: {
  programs.zed-editor = {
    enable = true;
    package = nixpkgs.unstable.zed-editor;

    extensions = [
      "nix"
    ];
    # extraPackages = with nixpkgs.unstable; [
    #   nixd
    #   alejandra
    # ];

    userSettings = {
      buffer_font_family = "Berkeley Mono Variable";
      buffer_font_size = 16;
      ui_font_family = "Public Sans";
      ui_font_size = 16;

      languages.Nix.language_servers = ["nixd" "!nil"];
      languages.Nix.formatter.external = {
        command = "alejandra";
        arguments = ["--quiet" "--"];
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "zeditor";
    VISUAL = "zeditor";
  };

  home.packages = with nixpkgs.unstable; [
    nixd
    alejandra
  ];

  catppuccin.zed.enable = true;
}
