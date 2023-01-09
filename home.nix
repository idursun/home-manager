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
    pkgs.exa
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
    userName = "ibrahim dursun";
    userEmail = "ibrahim@dursun.cc";
    delta.enable = true;
    extraConfig = {
      commit.gpgSign = true;
      gpg = {
        format = "ssh";
        ssh = {
          allowedSignersFile = "/home/ibrahim/.ssh/allowed_signers";
        };
      };
      pull.rebase = true;
      user = {
          email = "ibrahim@dursun.cc";
          name = "ibrahim dursun";
          signingkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDiajqeDzvV67w91mB9P29EMdRJrRmtn7/OGfYHUf2eeDpC0FzZG+/d26kyASA/jR3b89izIEeiF4T4DrUMkGx4J0kiaZbF+IMIy0cYxMWbZD9cg74NSBK0mXHLNLI+GnxSsiEguE6wRoswnzCYckYYfpVLwBcGEqR/1lC8MPTnBsj2MiESr79PjIZzOPJlGSdMp+LAVxt+Pdh/oukkIM2cpFjjBeiBg0jxH3P4YDCfpJ/0S9bOjSsgv8sbFo8ASFnY2MNHEJg2/ICA/DW9mvcgXBogB/Hqa+0TIOy8fSJwGMydc1qXju3ldqrPABFjPqjV1GGPDQSCAW70/y+7pu3bQxNjSCP6jB0T7s8Yyc7lDFk4eVOPybvf1mp6TYPhunmL64y6P0di2skw1+UXXt4/9o1jpslnMOUfDMWwQx+d1LL85AhKEYjDc8O0OuRBLrDY87Py6JGR4ob+xBMYWKmVN9NRUz6uXj9Mif6Wv4tNr5d1Oo0PLq756HyB+hvZgSzdHcsoILSWvJvArqn5plBFsNbBRTEy1bczwobb+lcCGIgkdISODR86AP9kjrOhcF8nQ2ncFAwoLG5dM8J1A7u0hZYrwAd7BboIBTgi9EgiuQIeHTTBEljL0Vreu4XiNvzS0a5E3lvoXT9Ua9UyGheD4XSCEDTb0w2iq9sQtBaFGQ==";
      };
    };
    includes = [
      { 
        condition = "gitdir:~/repositories/";
        contents = {
              user = {
                  email = "ibrahim@dursun.cc";
                  name = "ibrahim.dursun";
                  signingkey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDiajqeDzvV67w91mB9P29EMdRJrRmtn7/OGfYHUf2eeDpC0FzZG+/d26kyASA/jR3b89izIEeiF4T4DrUMkGx4J0kiaZbF+IMIy0cYxMWbZD9cg74NSBK0mXHLNLI+GnxSsiEguE6wRoswnzCYckYYfpVLwBcGEqR/1lC8MPTnBsj2MiESr79PjIZzOPJlGSdMp+LAVxt+Pdh/oukkIM2cpFjjBeiBg0jxH3P4YDCfpJ/0S9bOjSsgv8sbFo8ASFnY2MNHEJg2/ICA/DW9mvcgXBogB/Hqa+0TIOy8fSJwGMydc1qXju3ldqrPABFjPqjV1GGPDQSCAW70/y+7pu3bQxNjSCP6jB0T7s8Yyc7lDFk4eVOPybvf1mp6TYPhunmL64y6P0di2skw1+UXXt4/9o1jpslnMOUfDMWwQx+d1LL85AhKEYjDc8O0OuRBLrDY87Py6JGR4ob+xBMYWKmVN9NRUz6uXj9Mif6Wv4tNr5d1Oo0PLq756HyB+hvZgSzdHcsoILSWvJvArqn5plBFsNbBRTEy1bczwobb+lcCGIgkdISODR86AP9kjrOhcF8nQ2ncFAwoLG5dM8J1A7u0hZYrwAd7BboIBTgi9EgiuQIeHTTBEljL0Vreu4XiNvzS0a5E3lvoXT9Ua9UyGheD4XSCEDTb0w2iq9sQtBaFGQ==";
              };
        };
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
      { plugin = tmuxPlugins.dracula; 
        extraConfig = ''
          set -g @dracula-show-battery false
          set -g @dracula-show-timezone false
          set -g @dracula-show-location false
        '';
      }
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
