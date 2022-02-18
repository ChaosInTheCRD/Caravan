{ pkgs, config, ... }:

let
    dusk-vim = pkgs.vimUtils.buildVimPlugin {
        name = "dusk-vim";
        src = pkgs.fetchFromGitHub {
            owner = "notusknot";
            repo = "dusk-vim";
            rev = "8eb71f092ebfa173a6568befbe522a56e8382756";
            sha256 = "09l4hda5jnyigc2hhlirv1rc8hsnsc4zgcv4sa4br8fryi73nf4g";
        };
    };
in
  {
    enable = true;
    vimAlias = true;

    # init.vim stuff can go here
    extraConfig = ''
      set runtimepath^=${./lua}
      luafile ${./lua}/settings.lua
    '';

    # This installs all the plugins without an external plughin manager.
    plugins = with pkgs.vimPlugins; [
        # File tree
        nvim-web-devicons 
        nvim-tree-lua

        # LSP
        nvim-lspconfig

        # Languages
        vim-nix
        vim-terraform
        vim-go
        # Eyecandy 
        nvim-treesitter
        bufferline-nvim
        galaxyline-nvim
        nvim-colorizer-lua
        dusk-vim
        pears-nvim
        TrueZen-nvim
        goyo-vim

        # Lsp and completion
        nvim-lspconfig
        nvim-compe

        # Telescope
        telescope-nvim

        # Indent lines
        indent-blankline-nvim
    ];

  }

