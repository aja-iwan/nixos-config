{ inputs, config, lib, pkgs, ... }:

{
  imports = 
  [
    ./desktops/niri.nix
    #./desktops/hyprland.nix

    ./languages/kotlin.nix
    ./languages/python.nix
    ./languages/rust.nix

    ./programs/entertainment.nix
    ./programs/productivity.nix
  ];
}
