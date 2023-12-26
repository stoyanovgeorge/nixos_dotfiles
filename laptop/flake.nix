{
  description = "flake for nixos_kde with Home Manager enabled";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{
    self,
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
	  ./bluetooth.nix
	  ./virtualisation.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.gstoyanov = { pkgs, ... }: {
              home.username = "gstoyanov";
              home.homeDirectory = "/home/gstoyanov";
              programs.home-manager.enable = true;
              home.packages = with pkgs; [
                thunderbird
                kdenlive
                google-chrome
	        mpv
                python3
                openai-whisper
                # postman
		filezilla
                bat
                fzf
                btop
                eza
                ripgrep
                du-dust
                fd
                tealdeer
                procs
                ranger
                broot
                zoxide
                nushell
                sd
                inferno
                jc
                jq
                ffmpeg
		mediainfo
                flameshot
              ];
              home.stateVersion = "23.11";
            };
          }
        ];
      };
    };
  };
}
