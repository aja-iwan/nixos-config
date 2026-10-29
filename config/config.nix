{ config, lib, pkgs, ... }:

{
  xdg.configFile."niri" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/config/niri";
  };

  xdg.configFile."kitty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/config/kitty";
  };

  xdg.configFile."tmux" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/config/tmux";
  };

  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/config/nvim";
  };

  xdg.configFile."yazi" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/config/yazi";
  };

  xdg.configFile."fastfetch" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/config/fastfetch";
  };

  xdg.configFile."noctalia" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/config/noctalia";
  };
}
