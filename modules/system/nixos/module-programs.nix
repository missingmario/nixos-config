{ pkgs, ... }:
{
  # Packages
  environment.systemPackages = [
    pkgs.ghostty
    pkgs.gnome-remote-desktop
  ];

  # Git
  programs.git = {
    enable = true;
  };

  # Neovim
  programs.neovim = {
    enable = true;
  };

  # Firefox
  programs.firefox = {
    enable = true;
  };
}
