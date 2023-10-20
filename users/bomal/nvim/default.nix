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
      nvim-treesitter.withAllGrammars
      copilot-vim
      lsp-zero-nvim
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      luasnip 
      flutter-tools-nvim
      zk-nvim
    ];
  };

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };

}
