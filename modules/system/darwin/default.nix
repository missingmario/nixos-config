{ ... }:
{
  imports = [
    ../shared
  ];

  # nix-darwwin state version (DO NOT MODIFY)
  system.stateVersion = 5;

  # sudo
  security.pam.services.sudo_local = {
    enable = true;

    reattach = true;
    touchIdAuth = true;
  };
}
