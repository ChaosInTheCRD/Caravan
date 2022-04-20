{ config, pkgs, lib, ... }:

let
  inherit (lib) getName mkIf optional;
  inherit (config.lib.file) mkOutOfStoreSymlink;
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
  
in

{
  # Neovim
  # https://rycee.gitlab.io/home-manager/options.html#opt-programs.neovim.enable
  programs.neovim.enable = true;
  programs.neovim.vimAlias = true;
  
  # Config and plugins ------------------------------------------------------------------------- {{{

  # Minimal init.vim config to load Lua config. Nix and Home Manager don't currently support
  # `init.lua`.
  xdg.configFile."nvim/lua".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/nvim/lua";
  xdg.configFile."nvim/colors".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/nvim/colors";
  xdg.configFile."nvim/coc-settings.json".source = mkOutOfStoreSymlink "${nixConfigDir}/configs/nvim/coc-settings.json";
  
  programs.neovim.extraConfig = ''
    set nocompatible

    lua require ("user.options")
    lua require ("user.keymaps")
    lua require ("user.plugins")
    lua require ("user.lsp")
    lua require ("user.cmp")
    lua require ("user.telescope")
    lua require ("user.treesitter")
    lua require ("user.autopairs")
    lua require ("user.gitsigns")
    lua require ("user.nvim-tree")
    lua require ("user.bufferline")
    lua require ("user.lualine")
    lua require ("user.toggleterm")
    lua require ("user.impatient")
    lua require ("user.project")
    lua require ("user.indentline")
    lua require ("user.alpha")
    lua require ("user.whichkey")
    lua require ("user.autocommands")
    lua require ('user.options')
    lua require ('user.keymaps')

    hi clear
    syntax reset
    let g:colors_name="dusk"
    colorscheme dusk
    '';
}

