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
      kubernetes = {
        disabled = false;
      };
    };
  };
}
