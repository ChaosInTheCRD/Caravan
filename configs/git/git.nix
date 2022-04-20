{ pkgs, ... }:

{
    programs.git = {
      enable = true;
      userName = "ChaosInTheCRD";
      aliases = {
        st = "status";
      };
    };
}
