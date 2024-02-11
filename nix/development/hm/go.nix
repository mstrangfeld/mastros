{pkgs, ...}: {
  home.packages = with pkgs; [
    go # The Go Programming language
    gopls # Official language server for the Go language
    golangci-lint # Fast linters Runner for Go
  ];
}
