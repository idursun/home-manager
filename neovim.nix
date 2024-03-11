{ pkgs, ... }:
{
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
}
