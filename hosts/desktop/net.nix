{hostname, ...}: {
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
  };

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };
}
