{pkgs, ...}: {
  home.packages = with pkgs; [
    yamlfmt # An extensible command line tool or library to format yaml files.
    yamllint # A linter for YAML files
    yaml-language-server # Language Server for YAML Files
  ];
}
