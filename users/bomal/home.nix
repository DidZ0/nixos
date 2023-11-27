{ inputs, lib, config, pkgs, ... }: {

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home.username = "bomal";
  home.homeDirectory = "/home/bomal";

  programs.fish = {
     enable = true; 
     interactiveShellInit = ''
       set fish_greeting # Disable greeting
     '';
     shellAliases = {
       switchusers = "home-manager switch --flake $HOME/.config/nixos";
       switchhosts = "sudo nixos-rebuild switch --flake $HOME/.config/nixos";
     };
  };

  home.packages = with pkgs; [
    kitty
    logseq
    signal-desktop
    nodejs
    authenticator
    rofi
    flameshot
    nnn
    neovim
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    VISUAL = "nvim";
    DIFFPROG = "nvim -d";
    MANPAGER = "nvim +Man!";
    MANWIDTH = "999";
    BROWSER = "chromium";
  };

  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];

  programs.home-manager.enable = true;
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
