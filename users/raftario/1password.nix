{
  nixpkgs,
  lib,
  ...
}: {
  programs.ssh.extraConfig = ''
    Host *
      IdentityAgent ~/.1password/agent.sock
  '';

  programs.git.extraConfig = {
    gpg.format = "ssh";
    "gpg \"ssh\"".program = "${lib.getExe' nixpkgs.unstable._1password-gui "op-ssh-sign"}";
    commit.gpgsign = true;
    user.signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEPIfCp5zhE17liD/y2PEMtojAiz5R1Go6OG2eU2d1TP";
  };

  services.gnome-keyring.enable = true;
}
