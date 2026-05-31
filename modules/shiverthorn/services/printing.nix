{
  services = {
    printing = {
      enable = true;
      startWhenNeeded = true;
      browsed.enable = false;
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
      ipv6 = false;

      extraConfig = ''
        [server]
        ratelimit-interval-usec=500000
        ratelimit-burst=500
      '';
    };
  };

  systemd.services = {
    avahi-daemon.serviceConfig.TimeoutStopSec = "15s";
    cups.serviceConfig.TimeoutStopSec = "15s";
  };
}
