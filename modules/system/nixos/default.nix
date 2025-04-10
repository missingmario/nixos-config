{ ... }:
let
  locale = "en_US.UTF-8";
in
{
  imports = [
    ../shared

    ./module-desktop.nix
    ./module-programs.nix
    ./module-shell.nix
  ];

  # NixOS state version (DO NOT MODIFY)
  system.stateVersion = "24.11";

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Virtualization
  virtualisation.vmware.guest.enable = true;

  # System Time
  time.timeZone = "Europe/Madrid";
  time.hardwareClockInLocalTime = false;

  # Locale
  i18n.defaultLocale = locale;

  # Networking
  networking.hostName = "mario-vmware-nixos";
  networking.networkmanager.enable = true;

  # OpenSSH
  services.openssh = {
    enable = true;
    settings = {
      AllowUsers = [ "mario" ];
    };
  };

  # Tailscale
  services.tailscale = {
    enable = true;
  };
}
