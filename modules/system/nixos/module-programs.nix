{ pkgs, ... }:
{
  # Packages
  environment.systemPackages = [
    pkgs.ghostty
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
