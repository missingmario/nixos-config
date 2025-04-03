{
  pkgs,
  vars,
  ...
}:
let
  nixosUser = {
    isNormalUser = true;
    description = "Mario Sanchez Lara";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
  darwinUser = {
    home = "/Users/mario";
  };
in
{
  users.users.mario =
    if vars.isNixos then
      nixosUser
    else if vars.isDarwin then
      darwinUser
    else
      null;

  home-manager.users.mario = ./home.nix;
}
