{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk17
    kotlin
    kotlin-language-server
  ];
}
