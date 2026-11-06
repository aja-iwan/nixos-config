{ inputs, config, lib, pkgs, ... }:

{
  imports = [ inputs.noctalia.nixosModules.default ];

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
  };

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}
