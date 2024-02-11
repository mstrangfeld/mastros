{
  description = "mastros";

  inputs.nixos.url = "nixpkgs/nixos-unstable";
  inputs.nixpkgs.follows = "nixos";

  inputs.nix.url = "nix/2.20.1";
  inputs.flake-registry.url = "github:NixOS/flake-registry";
  inputs.flake-registry.flake = false;

  inputs.nixos-hardware.url = "github:nixos/nixos-hardware";
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.home-manager.inputs.nixpkgs.follows = "nixos";

  inputs.std.url = "github:divnix/std";
  inputs.std.inputs.nixpkgs.follows = "nixos";
  inputs.std.inputs.devshell.url = "github:numtide/devshell";
  inputs.std.inputs.nixago.url = "github:nix-community/nixago";

  outputs = {
    self,
    std,
    nixpkgs,
    ...
  } @ inputs: let
    l = nixpkgs.lib // builtins;

    system = builtins.currentSystem or "x86_64-linux";
    systems = [system];
  in
    std.growOn {
      inherit inputs;
      cellsFrom = ./nix;
      cellBlocks = with std.blockTypes; [
        (nixago "configs")
        (devshells "shells")
        (functions "lib")
        (data "profiles")
        (data "modules")
        (data "hm")
        (data "hosts")
        (installables "systems")
      ];

      nixpkgsConfig.allowUnfree = true;
    }
    (l.mapAttrs (_: v: v.${system}) {
      lib = std.harvest self ["mastros" "lib"];
      nixosConfigurations = std.harvest self ["mstrangfeld" "hosts"];
      homeModules = std.harvest self [
        ["development" "hm"]
        ["shell" "hm"]
      ];
    });

  nixConfig = {};
}
