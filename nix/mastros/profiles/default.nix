{
  inputs,
  cell,
}: let
  inherit (inputs.nixpkgs) lib;
in {
  nix = {
    imports = [
      ./nix.nix
    ];

    nix = {
      registry = let
        sanitized = builtins.removeAttrs inputs ["nixpkgs" "cells" "self" "std"];
      in
        builtins.mapAttrs
        (_: flake: {inherit flake;})
        sanitized;
      package = inputs.nix.packages.nix;
      nixPath = ["home-manager=${inputs.home-manager}"];
      settings = let
        # merge config from flake.nix
        inherit (import "${inputs.self}/flake.nix") nixConfig;
      in
        (lib.mapAttrs' (n: v: lib.nameValuePair (lib.removePrefix "extra-" n) v) nixConfig)
        // {
          flake-registry = "${inputs.flake-registry}/flake-registry.json";
        };
    };
  };

  home-manager = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];
  };
}
