{ inputs, config, lib, pkgs, ... }:

{
  imports = 
  [
    ./desktops/gnome.nix
    ./desktops/niri.nix
    #./desktops/hyprland.nix

    ./languages/kotlin.nix
    ./languages/lua.nix
    ./languages/python.nix
    ./languages/rust.nix

    ./programs/entertainment.nix
    ./programs/productivity.nix
  ];
}
