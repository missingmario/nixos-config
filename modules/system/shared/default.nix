{ vars, ... }:
{
  # Configuration revision
  # system.configurationRevision = vars.rev;

  # Nix
  nix = {
    extraOptions = ''
      experimental-features = nix-command flakes
      use-xdg-base-directories = true
    '';
  };

  # Nixpkgs
  nixpkgs = {
    hostPlatform = vars.system;
    config.allowUnfree = true;
  };
}
