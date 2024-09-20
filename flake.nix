{
  inputs.disko.url = "github:nix-community/disko";
  inputs.disko.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, disko }: {
    # change `yourhostname` to your actual hostname
    nixosConfigurations.disko-laptop = nixpkgs.lib.nixosSystem {
      # change to your system:
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        disko.nixosModules.disko
        ./disk-config.nix
      ];
    };
  };
}

