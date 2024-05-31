{ config, lib, pkgs, ... }:

let
  user = import ./env.nix;
in
{
  imports = [
    ./starship.nix
    ./git.nix
    ./neovim.nix
    ./zsh.nix
    ./tmux.nix
  ];
  manual.manpages.enable = false;
  home.enableNixpkgsReleaseCheck = false;
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = user.username;
  home.homeDirectory = user.homeDirectory;

  home.packages = [
    pkgs.htop
    pkgs.ripgrep
    pkgs.bat
    pkgs.eza
    pkgs.kubectl
    pkgs.kubectx
    pkgs.starship
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zellij = {
    enable = true;
    enableZshIntegration = false;
    settings = {
      theme = "dracula";
    };
  };

  programs.fzf.enable = true;

  programs.helix = {
    enable = true;
    settings = {
      theme = "dracula";
    };
    languages = {
      language =  [
        {
          name = "elixir";
          auto-format = true;
        }
        {
          name = "rust";
          auto-format = true;
        }
      ];
    };
  };
}
