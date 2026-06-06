# https://wiki.nixos.org/wiki/Laptop
{lib, ...}: {
  services = {
    logind.settings.Login.HandleLidSwitchExternalPower = "suspend-then-hibernate";

    # Disable GNOME power profiles
    power-profiles-daemon.enable = lib.mkForce false;

    thermald.enable = true;

    tlp = {
      enable = true;
      settings = {
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";

        # Disable CPU boosts on battery power
        CPU_BOOST_ON_BAT = 0;
        CPU_BOOST_ON_SAV = 0;
        CPU_HWP_DYN_BOOST_ON_BAT = 0;
        CPU_HWP_DYN_BOOST_ON_SAV = 0;

        # Lock clocks to lowest state on Battery
        RADEON_DPM_PERF_LEVEL_ON_BAT = "low";
      };
    };
  };

  systemd = {
    sleep.settings.Sleep.HibernateDelaySec = "30m";
    services."systemd-suspend-then-hibernate".aliases = ["systemd-suspend.service"];
  };
}
