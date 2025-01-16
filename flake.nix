{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin.url = "github:catppuccin/nix";
  };

  outputs = inputs @ {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    catppuccin,
    ...
  }: {
    nixosConfigurations = let
      hosts = {
        desktop = {
          system = "x86_64-linux";
          state = "24.11";

          users = {
            raftario = {
              groups = ["wheel"];
              shell = "zsh";
            };
          };
        };
      };
      f = {
        map = builtins.mapAttrs;
      };
    in
      f.map (hostname: {
        system,
        state,
        users,
      }:
        nixpkgs.lib.nixosSystem rec {
          inherit system;

          specialArgs = {
            inherit hostname inputs system state;

            nixpkgs = let
              options = {
                inherit system;
                config.allowUnfree = true;
              };
            in {
              stable = import nixpkgs options;
              unstable = import nixpkgs-unstable options;
            };
          };

          modules = [
            ./configuration.nix
            ./hosts/${hostname}.nix
            {
              system.stateVersion = state;
              programs.zsh.enable = true;
              users.defaultUserShell = specialArgs.nixpkgs.stable.zsh;
            }

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = specialArgs;

              home-manager.users =
                f.map (username: {...}: {
                  home = {
                    inherit username;
                    homeDirectory = "/home/${username}";
                    stateVersion = state;
                  };

                  imports = [
                    ./users/${username}.nix
                    catppuccin.homeManagerModules.catppuccin
                  ];
                })
                users;

              users.users =
                f.map (username: {
                  groups,
                  shell,
                }: {
                  isNormalUser = true;
                  extraGroups = groups;
                  shell = specialArgs.nixpkgs.stable.${shell};
                })
                users;
            }
            catppuccin.nixosModules.catppuccin
          ];
        })
      hosts;
  };
}
