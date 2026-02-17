{ pkgs, ... }:
{
  config = {
    nixpkgs.hostPlatform = "x86_64-linux";

    # Enable and configure services
    services = {
      # nginx.enable = true;
      mysql = {
        enable = true;
        package = pkgs.mariadb;
      };
    };

    # virtualisation.docker.enable = true;

    environment = {
      systemPackages = with pkgs; [
        # hello
      ];

      etc = {
        environment = {
          source = ./environment;
          replaceExisting = true;
        };
        "nix/nix.conf".replaceExisting = true;
      };
    };
  };
}
