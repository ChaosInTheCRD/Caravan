{ config, ... }:

let
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in

{
  # Config -------------------------------------------------------------------------
  xdg.configFile."yabai/yabairc".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/yabai/yabairc";
  xdg.configFile."skhd/skhdrc".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/yabai/skhdrc";
  xdg.configFile."spacebar/spacebarrc".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/yabai/spacebarrc";
  xdg.configFile."scripts/flow.applescript".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/yabai/scripts/flow.applescript";
}
