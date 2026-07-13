# https://crescentro.se/posts/windows-vm-nixos/
# https://wiki.nixos.org/wiki/Libvirt
{
  config,
  pkgs,
  ...
}: {
  virtualisation = {
    libvirtd = {
      enable = true;

      # TPM emulation
      qemu.swtpm.enable = true;
    };

    # USB redirection
    spiceUSBRedirection.enable = true;
  };

  # Allow VM management
  users.users."${config.my.user}".extraGroups = ["libvirtd" "kvm"];

  environment.systemPackages = with pkgs; [
    dnsmasq # VM networking
    gnome-boxes
    virt-v2v
  ];

  networking.firewall.trustedInterfaces = ["virbr0"];
}
