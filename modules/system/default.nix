{ pkgs, ... }:
{



  # Firefox
  programs.firefox.enable = true;

  # Packages
  environment.systemPackages = [
    pkgs.ghostty

    pkgs.git
    pkgs.neovim
  ];

}
