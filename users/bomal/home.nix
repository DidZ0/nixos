{ inputs, lib, config, pkgs, ... }: {

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs.home-manager.enable = true;
  home.username = "bomal";
  home.homeDirectory = "/home/bomal";

  home.packages = with pkgs; [
    signal-desktop
    flameshot
    neovim
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    VISUAL = "nvim";
    DIFFPROG = "nvim -d";
    MANPAGER = "nvim +Man!";
    MANWIDTH = "999";
    BROWSER = "firefox";
  };


  programs.git = {
    enable = true;
    userName  = "Yan IMENSAR";
    userEmail = "yimensar@4cad.fr";
  };
  programs.vscode= {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
    	github.copilot
    ];
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.bash.shellAliases = {
    switch = "home-manager switch --flake $HOME/.config/nixos";
    nixoswitch = "sudo nixos-rebuild switch --flake $HOME/.config/nixos";
  };
  
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.11";
}
