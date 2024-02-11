{pkgs, ...}: {
  home.packages = with pkgs; [
    bats # Bash Automated Testing System
    bash # GNU Bourne-Again Shell, the de facto standard shell on Linux
    nodePackages.bash-language-server # A language server for Bash
    shellcheck # Shell script analysis tool
    shfmt # A shell parser and formatter
  ];
}
