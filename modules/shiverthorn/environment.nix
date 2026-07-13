{
  pkgs,
  lib,
  ...
}: {
  environment = {
    defaultPackages = lib.mkForce [];
    systemPackages = with pkgs; [
      jetbrains.pycharm
      anki
      keepassxc
      inkscape
      krita
      gimp
      onlyoffice-desktopeditors
      blender
      shotcut
      signal-desktop
      halloy
      prismlauncher
      supertuxkart
      pear-desktop

      imhex
      radare2

      termshark
      tshark
      bruno
      httpie
      mitmproxy
      wget

      helix
      ffmpeg
      imagemagick
      sshfs
      comma
      gnupg
      jq
      ripgrep
      fd
      python3
      rsync

      usbmuxd
    ];

    shellAliases = {
      ll = "eza -l";
      la = "eza -a";
      lla = "eza -al";

      # Overrides
      cat = "bat";

      # Programs
      g = "git";
      py = "python";
    };

    variables = {
      EDITOR = "hx";
      VISUAL = "hx";
    };
  };

  fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
  ];
}
