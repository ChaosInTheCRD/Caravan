{ config, ... }:

let
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";

in

{

  # Config and widgets ------------------------------------------------------------------------- {{{
  xdg.configFile."brew/Brewfile".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/brew/Brewfile";
}
