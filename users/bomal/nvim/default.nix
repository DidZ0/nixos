{ config, pkgs, lib, ... }: {

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    plugins = with pkgs.vimPlugins; [
      gruvbox-nvim
      plenary-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      telescope-file-browser-nvim
      which-key-nvim
      nvim-web-devicons
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      copilot-vim
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };

}
