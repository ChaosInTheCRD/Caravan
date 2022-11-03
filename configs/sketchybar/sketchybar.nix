{ config, ... }:

let
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in

{
  # Config and widgets ------------------------------------------------------------------------- {{{
  xdg.configFile."sketchybar".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/sketchybar/config";
}
