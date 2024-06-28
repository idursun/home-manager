{
  programs.zsh = {
    enable = true;
    history = {
      ignoreDups = true;
    };
    defaultKeymap = "emacs";
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true; 
    initExtra = ''
      autoload edit-command-line; zle -N edit-command-line

      bindkey  "^[[H"   beginning-of-line
      bindkey  "^[[F"   end-of-line
      bindkey  "^[[3~"  delete-char
      bindkey  "^X^E"   edit-command-line

      export COLORTERM=truecolor
      source <(kubectl completion zsh)
      source $HOME/.dev-local-setup
    '';
  };
}
