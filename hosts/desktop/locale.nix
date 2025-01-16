{...}: {
  console.useXkbConfig = true;
  services.xserver.xkb = {
    layout = "ca";
    variant = "fr";
    options = "alt_shift_toggle";
  };
  services.xserver.enable = false;

  time.timeZone = "America/Montreal";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_TIME = "en_CA.UTF-8";
      LC_MONETARY = "fr_CA.UTF-8";
      LC_NUMERIC = "fr_CA.UTF-8";
    };
  };
}
