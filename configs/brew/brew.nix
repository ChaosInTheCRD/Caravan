{ config, ... }:

let
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in

{

  # Config and widgets ------------------------------------------------------------------------- {{{
  xdg.configFile."brew/Brewfile".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/brew/Brewfile";
}
