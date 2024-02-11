{pkgs, ...}: {
  programs.nushell = {
    enable = true;
    package = pkgs.nushellFull;

    shellAliases = {
      lg = "lazygit";
      tmp = "cd (mktemp -d)";
      k = "kubectl";
      zz = "__zoxide_zi";
      ll = "ls -la";
    };

    configFile.source = ./config.nu;
    envFile.source = ./env.nu;
    loginFile.source = ./login.nu;

    environmentVariables = {
      EDITOR = "hx";
      FZF_DEFAULT_OPTS = "'--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8'";
    };

    extraEnv = let
      cfg = config.programs.zoxide;
      cfgOptions = concatStringsSep " " cfg.options;
    in ''
      let zoxide_cache = "${config.xdg.cacheHome}/zoxide"
      if not ($zoxide_cache | path exists) {
        mkdir $zoxide_cache
      }
      ${cfg.package}/bin/zoxide init nushell ${cfgOptions} |
        str replace "-- $rest" "-- ...$rest" --all | # https://github.com/ajeetdsouza/zoxide/issues/662
        str replace "def-env" "def --env" --all |  # https://github.com/ajeetdsouza/zoxide/pull/632
        save --force ${config.xdg.cacheHome}/zoxide/init.nu
    '';

    extraConfig = ''
      source ${config.xdg.cacheHome}/zoxide/init.nu
    '';
  };
}
