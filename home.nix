{ config, pkgs, ... }:
 let
    # Import extra files
    inherit (pkgs) stdenv;
    unstable = import <unstable> {};
  in
  {
    # Home Manager needs a bit of information about you and the
    # paths it should manage.

    home.homeDirectory = if stdenv.isLinux then "/home/tom" else "/Users/tom";
    home.username = "tom";

    imports = [
      ./configs/nvim/neovim.nix
      ./configs/zsh/zsh.nix
      ./configs/git/git.nix
      ./configs/ubersicht/ubersicht.nix
      ./configs/brew/brew.nix
      ./configs/alacritty/alacritty.nix
      ./configs/yabai/yabai.nix
    ];

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    fonts.fontconfig.enable = true;

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
        fzf ripgrep argo argocd bat colordiff cowsay toilet colima
        gawk kubectx kubectl google-cloud-sdk kustomize
        helmfile kubernetes-helm htop hugo k9s krew stern

        minikube neofetch octant sipcalc tmate tree wget ngrok
        watch git-crypt gnupg gpg-tui cosign jq docker-client starship diceware glow spicetify-cli

        # Development
        git gcc gnumake python3 go nodejs cargo go yarn protobuf

        # fonts

        (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono" ]; })

    ] ++ (with unstable; [      
      terraform terragrunt neovim
  ]);

  }
