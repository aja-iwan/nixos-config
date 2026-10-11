{ inputs, config, lib, pkgs, ... }:

{
  imports = 
  [
    ./desktops/gnome.nix
    ./desktops/niri.nix
    ./desktops/noctalia.nix

    ./languages/kotlin.nix
    ./languages/python.nix

    ./programs/entertainment.nix
    ./programs/productivity.nix
  ];
}
