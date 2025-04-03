{ pkgs, ... }:
{
  # Shells
  environment.shells = [
    pkgs.bashInteractive
    pkgs.zsh
  ];

  # zsh
  programs.zsh = {
    enable = true;
  };
}
