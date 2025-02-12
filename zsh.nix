{
  programs.zsh = {
    enable = true;
    history = {
      ignoreDups = true;
    };
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    sessionVariables = {
      KEYTIMEOUT = 1;
    };
    initExtra = ''
      autoload edit-command-line; zle -N edit-command-line
      bindkey  "^X^E"   edit-command-line
      bindkey "^?" backward-delete-char
      bindkey "^W" backward-delete-word

      ${builtins.readFile ./zle-keymap-select.zsh}

      export COLORTERM=truecolor
      export PATH=$PATH:/Users/idursun/.cargo/bin
      source <(kubectl completion zsh)
      source <(jj util completion zsh)
      source $HOME/.dev-local-setup
    '';
  };
}
