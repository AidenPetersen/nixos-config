{ config, pkgs, ... }:
{
  imports = [
    ./coc-lsps.nix
  ];
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    coc.enable = true;
    # Plugins    
    plugins = with pkgs.vimPlugins; [
      # Navigation
      vim-dirvish
      fzf-vim
      coc-explorer
      telescope-nvim

      # Terminal
      toggleterm-nvim

      # COC stuff
      coc-nvim
      coc-rust-analyzer
      coc-json
      coc-python
      coc-html
      coc-java
      coc-clangd
      coc-fzf
      coc-metals
      
      # Language Specific
      rust-vim
      vim-nix
      vim-go

      # Misc
      nvim-treesitter
      coq_nvim
      gruvbox
      lualine-nvim
      nvim-web-devicons
      vim-sleuth
      direnv-vim

      # Git
      vim-gitgutter

    ];
    extraConfig = builtins.readFile ./config.vim;
  };
}
