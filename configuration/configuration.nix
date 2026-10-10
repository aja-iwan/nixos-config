{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./features/features.nix
    ./modules/modules.nix
  ];

  services.flatpak.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}
