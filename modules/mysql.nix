{
  nixosModulesPath,
  config,
  lib,
  ...
}:
{
  imports = [
    (nixosModulesPath + "/services/databases/mysql.nix")
  ];

  systemd.services.mysql = lib.mkIf config.services.mysql.enable {
    wantedBy = lib.mkForce [ "system-manager.target" ];
  };
}
