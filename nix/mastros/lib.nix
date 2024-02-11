{
  inputs,
  cell,
}: let
  inherit (inputs) nixos;
in {
  mastrosSystem = {
    nixpkgs ? nixos,
    system ? nixos.legacyPackages.system,
    profiles ? [],
    recursiveProfiles ? config: [],
  }: let
    modules = let
      recursiveModule = {config, ...}: let
        imports = recursiveProfiles config;
      in {
        inherit imports;
      };
    in
      [
        recursiveModule
        cell.profiles.nix
        # ({
        #   config,
        #   lib,
        #   ...
        # }: {
        #   options.deploy = lib.mkEnableOption (lib.mdDoc "Whether to create a Colmena deployment profile");
        # })
      ]
      ++ profiles;
  in
    nixpkgs.lib.nixosSystem {
      inherit system modules;
    }
    // {inherit modules;};
}
