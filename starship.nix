{ lib, ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      format = lib.concatStrings [
        "$all"
        "$kubernetes"
        "$line_break"
        "$shell"
        "$character"
      ];
      elixir = {
        disabled = true;
      };
      kubernetes = {
        disabled = true;
        contexts = [
          { context_pattern = "kind.*"; style = "green"; }
          { context_pattern = ".*-aks"; style = "red"; }
        ];
      };
    };
  };
}
