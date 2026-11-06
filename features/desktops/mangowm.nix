{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    inputs.mangowm.nixosModules.mango
    ./noctalia.nix
  ];

  programs.mango.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "gtk" ];
  };
 
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  security.polkit.enable = true;
 
  environment.systemPackages = with pkgs; [
    xwayland-satellite
    hyprpolkitagent
    kdePackages.qtwayland
    qt5.qtwayland
  ];
}
