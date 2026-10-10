{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vscode.fhs
    #kdePackages.kdenlive
    #ffmpeg-full
    #frei0r
  ];
}
