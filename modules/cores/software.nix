{ inputs, config, lib, pkgs, ... }:

{
  users.users."iwan" = {
    isNormalUser = true;
    description = "iwan";
    extraGroups = [ "networkmanager" "wheel" "kvm" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      gcc
      curl
      wget
      perl
      cmake
      unzip
      sassc
      wmctrl
      gnumake
      fastfetch
    ];
  };

  environment.systemPackages = with pkgs; [
    gnome-themes-extra
    adwaita-icon-theme
    nwg-look
    nautilus
    brave
    kitty
    neovim
    vulkan-tools
    wl-clipboard
    tree-sitter
    ripgrep
    fzf
    fd
  ];
  
  programs.zsh.enable = true;
  programs.tmux.enable = true;
  programs.dconf.enable = true;
  services.gvfs.enable = true;

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
