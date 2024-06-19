{
  programs.zsh = {
    enable = true;
    history = {
      ignoreDups = true;
    };
    defaultKeymap = "viins";
    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true; 
    initExtra = ''
      bindkey  "^[[H"   beginning-of-line
      bindkey  "^[[F"   end-of-line
      bindkey  "^[[3~"  delete-char
      bindkey ^R history-incremental-search-backward 
      bindkey ^S history-incremental-search-forward

      autoload edit-command-line; zle -N edit-command-line
      bindkey -M vicmd v edit-command-line
      export COLORTERM=truecolor
      source <(kubectl completion zsh)
      source $HOME/.dev-local-setup
    '';
  };
}
