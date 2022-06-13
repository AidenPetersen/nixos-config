{ config, pkgs, ... }:
{
  programs.neovim.extraPackages = with pkgs; [
    rnix-lsp
  ];
  programs.neovim.coc.settings = {
    languageserver = {
      haskell = {
        command = "haskell-language-server-wrapper";
        args = [ "--lsp" ];
        rootPatterns = [
          "*.cabal"
          "cabal.project"
          ".stack.yaml"
          ".hie-bios"
          "BUILD.bazel"
          "cabal.config"
          "package.yaml"
        ];
        filetypes = [
          "hs"
          "lhs"
          "haskell"
        ];
      };  
      nix = {
        command = "rnix-lsp";
        filetypes = [ "nix" ];
      };
    };
    explorer.icon.enableNerdfont = true;
  };
}
