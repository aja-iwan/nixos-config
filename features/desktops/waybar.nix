{ inputs, config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    waybar
    awww
    rofi
    grim
    slurp
    cliphist
    swaynotificationcenter
    polkit_gnome
  ];

  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
}
