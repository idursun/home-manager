{ pkgs, lib, ... }:
let
  nvimConfig = pkgs.fetchFromGitHub {
    owner = "idursun";
    repo = "nvim-config";
    rev = "main"; 
    sha256 = "sha256-nAIgx/yqBhnH0JgeCGSrYA93wMGDZqfBXma9DTMtAB0=";
  };
in
{
  home.file.".config/nvim" = {
    source = nvimConfig;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
