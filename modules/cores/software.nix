{ inputs, config, lib, pkgs, ... }:

{
  users.users."iwan" = {
    isNormalUser = true;
    description = "iwan";
    extraGroups = [ "networkmanager" "wheel" "video" "kvm" ];
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
      btop
    ];
  };

  environment.systemPackages = with pkgs; [
    gnome-themes-extra
    adwaita-icon-theme
    nwg-look
    brave-origin
    nautilus
    kitty
    neovim
    satty
    pavucontrol
    wl-clipboard
    tree-sitter
    ripgrep
    fzf
    fd
  ];
  
  programs.zsh.enable = true;
  programs.tmux.enable = true;
  programs.dconf.enable = true;
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  programs.nautilus-open-any-terminal = {
    enable = true;
    terminal = "kitty";
  };

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
