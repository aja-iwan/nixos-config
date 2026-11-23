{ inputs, config, lib, pkgs, ... }:

{
  imports = [ ./waybar.nix ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.hyprland.default = [ "hyprland" "gtk" ];
  };
  
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services.hypridle.enable = true;
  programs.hyprlock.enable = true;
  security.polkit.enable = true;
  
  environment.systemPackages = with pkgs; [
    hyprpicker
    hyprsunset
    qt5.qtwayland
    qt6.qtwayland
  ];
}
