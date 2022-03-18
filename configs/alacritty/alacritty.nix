{ config, ... }:

let
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in

{
  # Config and -------------------------------------------------------------------------
  xdg.configFile."alacritty.yml".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/alacritty/alacritty.yml";
}
