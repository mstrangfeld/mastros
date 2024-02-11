{
  inputs,
  cell,
}:
builtins.mapAttrs (n: v: v.config.system.build.toplevel) cell.hosts
