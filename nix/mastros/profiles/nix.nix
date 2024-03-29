{
  pkgs,
  lib,
  ...
}: {
  nix = {
    gc.automatic = lib.mkDefault true;
    gc.dates = "weekly";
    optimise.automatic = true;

    nixPath = [
      "nixpkgs=${pkgs.path}"
      "nixos-config=/etc/nixos/configuration.nix"
    ];

    settings = {
      auto-optimise-store = true;
      allowed-users = ["@wheel"];
      trusted-users = ["root" "@wheel"];
      experimental-features = [
        "flakes"
        "nix-command"
        "repl-flake"
      ];
      accept-flake-config = true;
    };
  };
}
