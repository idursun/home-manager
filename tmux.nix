{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    mouse = true;
    shortcut = "b";
    terminal = "screen-256color";
    plugins = with pkgs; [
      { plugin = tmuxPlugins.dracula;
        extraConfig = ''
          set -g @dracula-plugins "none"
        '';
      }
    ];
  };
}
