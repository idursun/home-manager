{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    mouse = true;
    terminal = "screen-256color";
    escapeTime = 0;
    plugins = with pkgs; [
      { plugin = tmuxPlugins.dracula;
        extraConfig = ''
          set -g @dracula-plugins "none"
        '';
      }
    ];
  };
}
