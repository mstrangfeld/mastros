{ pkgs, ... }: {
  home.packages = with pkgs; [
    age # Modern encryption tool with small explicit keys
    bash # GNU Bourne-Again Shell, the de facto standard shell on Linux
    bat # A cat(1) clone with wings
    binutils # Tools for manipulating binaries (linker, assembler, etc.)
    bottom #  Yet another cross-platform graphical process/system monitor.
    cht-sh # CLI for cheat.sh
    coreutils # The basic file, shell and text manipulation utilities of the GNU operating system
    curl # A command line tool for transferring files with URL syntax
    dnsutils # Domain name server
    dosfstools # Utilities for creating and checking FAT and VFAT file systems
    fd # A simple, fast and user-friendly alternative to find
    file # A program that shows the type of files
    fselect # Find files with SQL-like queries
    gh # GitHub CLI tool
    gitui # Blazing fast terminal-ui for Git written in Rust
    gnumake # A tool to control the generation of non-source files from sources
    gotop # A terminal based graphical activity monitor
    gptfdisk # Set of text-mode partitioning tools for Globally Unique Identifier (GUID) Partition Table (GPT) disks
    htop # An interactive process viewer for Linux
    httpie # A command line HTTP client
    iputils # A set of small useful utilities for Linux networking
    jq # A lightweight and flexible command-line JSON processor
    lazygit # Simple terminal UI for git commands
    magic-wormhole # Securely transfer data between computers
    moreutils # Growing collection of the unix tools that nobody thought to write long ago when unix was young
    p7zip # A new p7zip fork with additional codecs and improvements (forked from https://sourceforge.net/projects/p7zip/)
    perl # The standard implementation of the Perl 5 programmming language
    psmisc # A set of small useful utilities that use the proc filesystem (such as fuser, killall and pstree)
    ranger # File manager with minimalistic curses interface
    rclone # Command line program to sync files and directories to and from major cloud storage
    ripgrep # A utility that combines the usability of The Silver Searcher with the raw speed of grep
    termshark # A terminal UI for wireshark-cli, inspired by Wireshark
    tldr # Simplified and community-driven man pages
    ueberzug # An alternative for w3mimgdisplay
    unzip # An extraction utility for archives compressed in .zip format
    usbutils # Tools for working with USB devices, such as lsusb
    util-linux # A set of system utilities for Linux
    vim # The most popular clone of the VI editor
    wget # Tool for retrieving files using HTTP, HTTPS, and FTP
    whois # Intelligent WHOIS client from Debian
    xplr # A hackable, minimal, fast TUI file explorer

    fish # Just for nushell autocomplete
  ];

  # A shell extension that manages your environment
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableNushellIntegration = true;
  };

  # Command-line fuzzy finder written in Go
  programs.fzf = {
    enable = true;
  };

  # A terminal workspace with batteries included
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
    };
  };

  # A smarter cd command. Supports all major shells.
  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };
}
