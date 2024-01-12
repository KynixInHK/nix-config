{
  description = "NixOS Flakes Configuration";

  # Inputs
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    waybar.url = "github:Alexays/Waybar";
    waybar.flake = false;
    nur.url = "github:nix-community/NUR";
  };

  # Output
  outputs = { self, nixpkgs, home-manager, hyprland, nur, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { 
        inherit system;
        overlays = [
          nur.overlay
        ];
        config.allowUnfree = true;
      };
    in {
      nixosConfigurations = {
        "code-station-nix" = nixpkgs.lib.nixosSystem {
	  # system = "x86_64-linux";
          specialArgs = { inherit inputs pkgs; };
	  modules = [
	    ./system
	    nur.nixosModules.nur
	    home-manager.nixosModules.home-manager {
	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      # home-manager.extraSpecialArgs = { inherit inputs; };
	      home-manager.users.kynix = import ./home;
	    }
	  ];
        };
      
      
        homeConfigurations."kynix@code-station-nix" = home-manager.lib.homeManagerConfiguration {
          # pkgs = nixpkgs.legacyPackages.x86_64-linux;
	  specialArgs = { inherit inputs pkgs; };
          modules = [
            hyprland.homeManagerModules.default
            { wayland.windowManager.hyprland.enable = true; }
          ];
        };
      };
    };
}
