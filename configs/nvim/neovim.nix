{ config, ... }:

let
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
  inherit (config.lib.file) mkOutOfStoreSymlink;
in

{
  # Config -------------------------------------------------------------------------
  xdg.configFile.nvim = {
  source = ./NvChad;
  recursive = true;
  };

  # GoNeoVim Settings File (GoNeovim installed with brew)
  xdg.configFile."goneovim/settings.toml".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/nvim/settings.toml";

}
