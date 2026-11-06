{ inputs, config, lib, pkgs, ... }:

{
  services.displayManager = {
    ly.enable = true;
    ly.settings = {
      animation = "matrix";
      clear_password = true;
      bigclock = true;
      load = true;
      save = true;
    };
  };
}
