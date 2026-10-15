{ config, lib, pkgs, ... }:

{
  imports = [ ./config/config.nix ];

  home.username = "iwan";
  home.homeDirectory = "/home/iwan";
  home.stateVersion = "26.05"; 
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
      gt-log = "git log --oneline --graph --decorate";
      gt-diff = "git diff --staged";
      gt-stat = "git status -s";
      gt-comm = "git commit -m";
      gt-add = "git add .";
      tx-list = "tmux list-sessions";
      tx-kill = "tmux kill-server";
      g = "git";
      t = "tmux";
      n = "nvim";
      c = "clear";
      h = "history";
      q = "exit";
    };

    oh-my-zsh = {
      enable = true;
      theme = "bira"; 
      plugins = [ "git" "sudo" ]; 
    };
    
    initContent = ''
    if [ -z "$TMUX" ] && [ -n "$PS1" ]; then
      exec tmux
    fi

    fastfetch

    function y() {
        local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        command yazi "$@" --cwd-file="$tmp"
        IFS= read -r -d ' ' cwd < "$tmp"
        [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
        command rm -f -- "$tmp"
    }
    '';
  };
}
