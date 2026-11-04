{ inputs, config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  
  services.displayManager.noctalia-greeter = {
    enable = true;
    passwordlessSyncUsers = [ "iwan" ];
    settings = {
      cursor.size = 24;
      keyboard.layout = "us";
    };
    cursorTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
