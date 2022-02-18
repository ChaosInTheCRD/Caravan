{ config, pkgs, ... }:

  let
    # Import extra files
    # zshSettings = import ./confg/zsh/zsh.nix;
    customNeovim = import ./nvim/nvim.nix;
  
  in
  {
    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
    # Source extra config files
    programs.neovim = customNeovim pkgs;

    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "tom";
    home.homeDirectory = "/home/tom";

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.05";
    
    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [

        # Command-line tools
        fzf ripgrep newsboat ffmpeg tealdeer exa 
        pass gnupg slop bat tmux wireguard unzip xclip
        libnotify sct update-nix-fetchgit lowdown
       
        # Development
        git gcc gnumake python3 go

        # Language servers for neovim; change these to whatever languages you code in
        # Please note: if you remove any of these, make sure to also remove them from nvim/config/nvim/lua/lsp.lua!!
        rnix-lsp
        sumneko-lua-language-server
        terraform-ls
    ];

  }
