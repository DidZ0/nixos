{ config, pkgs, lib, ... }: {

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      telescope-nvim
      nvim-web-devicons
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      plenary-nvim
      gruvbox-nvim
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };

}
