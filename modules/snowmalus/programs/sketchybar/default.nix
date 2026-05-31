{pkgs, ...}: let
  luaPkgs = pkgs.lua55Packages;

  sketchybarConfig = pkgs.callPackage ./config {
    luaPackages = luaPkgs;
  };

  lua = luaPkgs.lua.withPackages (ps: [
    # ps.lua
    pkgs.sbarlua
    sketchybarConfig
  ]);
in {
  services.sketchybar = {
    enable = true;

    config = ''
      #!${lua}/bin/lua
        package.cpath = package.cpath .. ";${lua}/lib/?.so"
        require("init")
    '';
  };

  system.defaults.NSGlobalDomain._HIHideMenuBar = true;

  fonts.packages = with pkgs; [
    sketchybar-app-font
  ];
}
