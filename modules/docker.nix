{
  nixosModulesPath,
  config,
  lib,
  ...
}:
{
  imports = [
    (nixosModulesPath + "/virtualisation/docker.nix")
  ];

  config = lib.mkIf config.virtualisation.docker.enable {
    systemd.services.docker = {
      wantedBy = lib.mkForce [ "system-manager.target" ];
    };
    systemd.timers.docker-prune = {
      wantedBy = lib.mkForce [ "system-manager.target" ];
    };
  };
}
