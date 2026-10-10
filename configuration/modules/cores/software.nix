{ config, lib, pkgs, ... }:

{
  users.users."iwan" = {
    isNormalUser = true;
    description = "iwan";
    extraGroups = [ "networkmanager" "wheel" "kvm" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      gcc 
      git 
      curl 
      wget 
      perl 
      cmake 
      sassc 
      wmctrl
      gnumake
      fastfetch
    ];
  };

  environment.systemPackages = with pkgs; [
    brave
    neovim
    yazi
    kitty
    wl-clipboard
    tree-sitter
    ripgrep
    fzf
    fd
  ];
  
  programs.zsh.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "kitty.desktop" ];
    };
  };
}
