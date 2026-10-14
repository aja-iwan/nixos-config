{ config, lib, pkgs, ... }:

{
  xdg.configFile."niri" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/config/niri";
  };

  xdg.configFile."kitty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/config/kitty";
  };

  xdg.configFile."tmux" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/config/tmux";
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/config/nvim";
  };

  xdg.configFile."yazi" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/config/yazi";
  };

  xdg.configFile."fastfetch" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/config/fastfetch";
  };

  xdg.configFile."noctalia" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/config/noctalia";
  };
}
