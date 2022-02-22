{ config, pkgs, lib, ... }:

let
  inherit (lib) getName mkIf optional;
  inherit (config.lib.file) mkOutOfStoreSymlink;
  nixConfigDir = "${config.home.homeDirectory}/.config/nixpkgs";
  
in
{
  programs.zsh = {
  enable = true;
  enableCompletion = false;
  history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
  shellAliases = {
    ll = "ls -l";
    update = "home-manager switch";
  };
  oh-my-zsh = {
    enable = true;
    plugins = [ "git" "zsh-autosuggestions" "z" ];
    theme = "robbyrussell";
    };
  };
}

