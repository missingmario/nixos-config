{
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      ...
    }:
    let
      rev = self.rev or self.dirtyRev or null;
    in
    {
      nixosConfigurations."mario-vmware-nixos" =
        let
          system = "aarch64-linux";
          vars = {
            inherit system;
            inherit rev;
            isNixos = true;
            isDarwin = false;
          };
        in
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit vars;
          };
          modules = [
            home-manager.nixosModules.home-manager

            ./modules/system/nixos
            ./modules/user

            ./modules/hardware/virtual-machine/vmware.nix
          ];
        };

      darwinConfigurations."mario-macbook" =
        let
          system = "aarch64-darwin";
          vars = {
            inherit system;
            inherit rev;
            isNixos = false;
            isDarwin = true;
          };
        in
        nix-darwin.lib.darwinSystem {
          inherit system;
          specialArgs = {
            inherit vars;
          };
          modules = [
            home-manager.darwinModules.home-manager

            ./modules/system/darwin
            ./modules/user
          ];
        };
    };
}
