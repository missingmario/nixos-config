{ ... }:
{
  imports = [
    ../shared

    ./homebrew.nix
  ];

  # nix-darwwin state version (DO NOT MODIFY)
  system.stateVersion = 5;

  # sudo
  security.pam.enableSudoTouchIdAuth = true;
}
