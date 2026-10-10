{ inputs, config, lib, pkgs, ... }:

{
  imports = [
    ./cores/hardware.nix
    ./cores/software.nix
    ./cores/systems.nix
  ];
}
