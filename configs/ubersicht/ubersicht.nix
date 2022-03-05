{ config, ... }:

let
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";

in

{

  # Config and widgets ------------------------------------------------------------------------- {{{
  xdg.configFile."ubersicht/widgets".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/ubersicht/widgets";
}
