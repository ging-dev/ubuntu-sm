{ lib, ... }:
with lib;
{
  options = {
    system = {
      stateVersion = mkOption {
        type = types.str;
        default = "25.11";
      };
    };
    networking = {
      proxy = {
        envVars = mkOption {
          type = types.attrs;
          default = { };
        };
      };
    };
  };
}
