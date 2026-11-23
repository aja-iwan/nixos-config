{ config, lib, pkgs, ... }:

{
  imports = [ ./config/config.nix ];

  home.username = "iwan";
  home.homeDirectory = "/home/iwan";
  home.stateVersion = "26.05"; 

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      credential.helper = "store";
      core.askpass = "";

      user = {
        name = "aja-iwan";
        email = "ajai84799@gmail.com";
      };
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      os.editPreset = "nvim";
      refresher.refreshInterval = 2;
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake .#nixos";
      garbage = "sudo nix-collect-garbage -d";
      mkdir = "mkdir -pv";
      ls = "ls -a --color=auto";
      ll = "ls -lah --color=auto";
      tl = "tmux list-sessions";
      tk = "tmux kill-server";
      g = "lazygit";
      n = "nvim";
      b = "btop";
      c = "clear";
      h = "history";
      q = "exit";
    };

    oh-my-zsh = {
      enable = true;
      theme = "bira"; 
      plugins = [ "sudo" ]; 
    };

    initContent = ''
    if [ -z "$TMUX" ] && [ -n "$PS1" ]; then
      exec tmux
    fi
    '';
  };
}
