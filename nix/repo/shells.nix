/*
This file holds reproducible shells with commands in them.

They conveniently also generate config files in their startup hook.
*/
{
  inputs,
  cell,
}: let
  inherit (inputs.std) lib std;
in
  builtins.mapAttrs (_: lib.dev.mkShell) {
    # Tool Homepage: https://numtide.github.io/devshell/
    default = {
      name = "mastros development";

      imports = [
        std.devshellProfiles.default
      ];

      # Tool Homepage: https://nix-community.github.io/nixago/
      # This is Standard's devshell integration.
      # It runs the startup hook when entering the shell.
      nixago = [
        cell.configs.conform
        cell.configs.editorconfig
        cell.configs.githubsettings
        cell.configs.lefthook
        cell.configs.treefmt
      ];
    };
  }
