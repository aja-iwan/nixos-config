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
      gl = "git log --oneline --graph --decorate";
      gd = "git diff --staged";
      gs = "git status -s";
      gc = "git commit -m";
      ga = "git add .";
      g = "git";
      n = "nvim";
      t = "tmux";
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
