{
  programs.zsh = {
    enable = true;
    history = {
      ignoreDups = true;
    };
    defaultKeymap = "emacs";
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting = {
      enable = true;
    };
    initExtra = ''
      export COLORTERM=truecolor
      source <(kubectl completion zsh)
      source $HOME/.dev-local-setup
    '';
  };
}
