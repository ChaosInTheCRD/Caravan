{ config, ... }:

let
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in

{
  # Config -------------------------------------------------------------------------
  xdg.configFile."nvim/lua".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/nvim/NvChad/lua";
  xdg.configFile."nvim/init.lua".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/nvim/NvChad/init.lua";

  # GoNeoVim Settings File (GoNeovim installed with brew)
  xdg.configFile."goneovim/settings.toml".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/nvim/settings.toml";

}
