{ pkgs, ... }:

{
    programs.git = {
      enable = true;
      userName = "ChaosInTheCRD";
      userEmail = "thomas.meadows@jetstack.io";
      aliases = {
        st = "status";
      };
    };
}
