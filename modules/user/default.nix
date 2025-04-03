{ ... }:
{
  imports = [
    ./mario
  ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
}
