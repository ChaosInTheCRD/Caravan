{ config, ... }:

let
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in

{
  # Config and widgets ------------------------------------------------------------------------- {{{
  xdg.configFile."ubersicht/widgets".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/ubersicht/widgets";
}
