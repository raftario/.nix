{...}: {
  programs.git = {
    enable = true;

    userName = "Raphaël Thériault";
    userEmail = "self@raftar.io";

    ignores = [".env"];
    lfs.enable = true;

    extraConfig = {
      init.defaultBranch = "main";

      gpg.format = "ssh";
      commit.gpgsign = true;
    };
  };

  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
}
