{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra # The Uncompromising Nix Code Formatter
    nil # Yet another language server for Nix
  ];
}
