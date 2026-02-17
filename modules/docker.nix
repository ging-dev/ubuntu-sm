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

  systemd.services.docker = lib.mkIf config.virtualisation.docker.enable {
    wantedBy = lib.mkForce [ "system-manager.target" ];
  };
}
