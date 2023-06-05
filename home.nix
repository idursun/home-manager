{ config, lib, pkgs, ... }:

let
  user = import ./env.nix;
in
{
  manual.manpages.enable = false;
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = user.username;
  home.homeDirectory = user.homeDirectory;

  home.packages = [
    pkgs.htop
    pkgs.ripgrep
    pkgs.bat
    pkgs.exa
    pkgs.rust-analyzer
    pkgs.elixir_ls
    pkgs.kubectl
    pkgs.kubectx
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
    userName = "Ibrahim Dursun";
    userEmail = "ibrahim@dursun.cc";
    delta.enable = true;
    iniContent = {
      commit.gpgSign = true;
      gpg = {
        format = "ssh";
        ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      };
      pull.rebase = true;
      pull.ff = "only";
      init.defaultBranch = "main";
      user = {
          name = user.git.personal.name;
          email = user.git.personal.email;
          signingkey = user.git.personal.signingkey;
      };
    };

    aliases = {
      gg = "log --graph --abbrev-commit --decorate --date=relative --oneline --all";
    };

    extraConfig = {
      remote."origin".prune = true;
      credential.helper = "/usr/local/share/gcm-core/git-credential-manager";
      credential = {
        "https://dev.azure.com" = { useHttpPath = true; };
        "https://gh.stackoverflow.com" = { gitHubAuthModes = "oauth"; provider = "github"; };
      };
      merge.tool = "code";
      mergetool."code".cmd = "code --wait --merge $REMOTE $LOCAL $BASE $MERGED";
    };

    includes = [
      { 
        condition = "gitdir:~/repositories/";
        contents = {
          user = {
            name = user.git.personal.name;
            email = user.git.personal.email;
            signingkey = user.git.personal.signingkey;
          };
        };
      }
      { 
        condition = "gitdir:~/workspace/";
        contents = {
          user = {
            name = user.git.work.name;
            email = user.git.work.email;
            signingkey = user.git.work.signingkey;
          };
        };
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
    enableSyntaxHighlighting = true;
    initExtra = ''
      export COLORTERM=truecolor
      source <(kubectl completion zsh)
    '';
  };

  programs.fzf.enable = true;

  programs.starship.enable = true;

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
      pluginConfig = ''
        " Use tab for trigger completion with characters ahead and navigate.
        " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
        inoremap <silent><expr> <TAB>
              \ pumvisible() ? "\<C-n>" :
              \ <SID>check_back_space() ? "\<TAB>" :
              \ coc#refresh()
        inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

        function! s:check_back_space() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction
      '';
    };
    extraConfig = ''
      set ignorecase
      set tabstop=4
      set expandtab
      set hls
      set ruler
      set incsearch
      set relativenumber
      set smartcase
      set autoindent
      set hidden
      set nobackup
      set nowritebackup
      set signcolumn=yes
      set cmdheight=2
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
      set termguicolors
      let base16colorspace=256  " Access colors present in 256 colorspace
      colorscheme base16-dracula
      tnoremap <C-j> <C-\><C-N>
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
      {
        name = "rust";
        auto-format = true;
      }
    ];
  };
}
