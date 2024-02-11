{
  inputs,
  cell,
}: let
  inherit (inputs) cells;
in {
  kronos = with cells;
    mastros.lib.mastrosSystem {
      profiles = [
        ./kronos
      ];
    };
}
