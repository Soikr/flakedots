{pkgs, ...}: let
  discord-rpc-pkg = pkgs.callPackage ./rpc.nix {withTray = true;};
in {
  systemd.user.services.discord-rpc-extension = {
    enable = true;
    after = ["graphical-session.target"];
    wantedBy = ["graphical-session.target"];
    description = "Discord Rich Presence Extension Server";
    serviceConfig = {
      ExecStart = "${discord-rpc-pkg}/bin/discord-rpc-server";
      Restart = "always";
      RestartSec = "3";
    };
  };
}
