{ config, lib, pkgs, ... }:

{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    glib
    libx11
  ];

  environment.systemPackages = with pkgs; [
    obsidian
    zed-editor
    android-studio
    android-tools
    #kdePackages.kdenlive
    #ffmpeg-full
    #frei0r
    #gimp
  ];
}
