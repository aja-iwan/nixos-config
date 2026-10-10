{ config, lib, pkgs, ... }:

{
  programs.nix-ld.enable = true;
  environment.systemPackages = with pkgs; [
    android-studio
    android-tools
  ];
}
