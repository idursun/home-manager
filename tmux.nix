{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    shell = "${pkgs.zsh}/bin/zsh";
    terminal = "screen-256color";
    escapeTime = 0;
    plugins = with pkgs; [
      { plugin = tmuxPlugins.dracula;
        extraConfig = ''
          set -g default-command "${pkgs.zsh}/bin/zsh"
          set -g @dracula-plugins "none"
        '';
      }
    ];
  };
}
