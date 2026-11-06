{ inputs, config, lib, pkgs, ... }:

{
  imports = [ ./noctalia.nix ];
 
  programs.niri.enable = true;
 
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "gtk" ];
  };
 
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  systemd.user.services.niri.enableDefaultPath = false;
  security.polkit.enable = true;
 
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    hyprpolkitagent
    kdePackages.qtwayland
    qt5.qtwayland
  ];
}
