{ config, pkgs, ... }:

  let
    # Import extra files
  
  in
  {
    imports = [
      ./configs/nvim/neovim.nix
      ./configs/zsh/zsh.nix
    ];

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "tom";
    home.homeDirectory = "/Users/tom";

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
        fzf ripgrep argo bat colordiff cowsay colima
        gawk kubectx kubectl google-cloud-sdk kustomize
        helmfile kubernetes-helm htop hugo k9s krew stern
        minikube neofetch octant sipcalc terraform
        terragrunt tmate tree wget
       
        # Development
        git gcc gnumake python3 go nodejs cargo go yarn

        # Language servers for neovim; change these to whatever languages you code in
        # Please note: if you remove any of these, make sure to also remove them from nvim/config/nvim/lua/lsp.lua!!
        rnix-lsp
        sumneko-lua-language-server
        terraform-ls
        terraform-lsp
        gopls
        nodePackages.dockerfile-language-server-nodejs
        nodePackages.bash-language-server
    ];

  }
