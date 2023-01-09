{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "ibrahim";
  home.homeDirectory = "/home/ibrahim";

  home.packages = [
    pkgs.htop
    pkgs.ripgrep
    pkgs.bat
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

  programs.git = {
    enable = true;
    userEmail = "ibrahim@dursun.cc";
    delta.enable = true;
    includes = [
      { path = "~/.gitconfig-personal";
        condition = "gitdir:~/repositories/";
      }
      { path = "~/.gitconfig-work";
        condition = "gitdir:~/workspace/";
      }
    ];
  };

  programs.zsh = {
    enable = true;
    history = {
      ignoreDups = true;
    };
    defaultKeymap = "emacs";
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = false;
    initExtra = ''
      export COLORTERM=truecolor
    '';
  };
  programs.fzf.enable = true;
  programs.starship.enable = true;
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    shortcut = "b";
    plugins = with pkgs; [
      tmuxPlugins.dracula
    ];
  };
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      vim-sensible
      vim-surround
      vim-nix
      vim-rooter
      base16-vim
      vim-multiple-cursors
      vim-highlightedyank
    ];
    coc = {
      enable = true;
    };
    extraConfig = ''
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
      set termguicolors
      let base16colorspace=256  " Access colors present in 256 colorspace
      colorscheme base16-dracula
    '';
  };
  programs.helix = {
    enable = true;
    settings = {
      theme = "dracula";
    };
    languages = [
      {
        name = "elixir";
        auto-format = true;
      }
    ];
  };
}
