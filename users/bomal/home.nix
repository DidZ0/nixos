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
  home.packages = with pkgs; [
    (nerdfonts.override {fonts = [ "FiraCode" ]; }) 
    neovim
    nnn
    vscode
    logseq
    signal-desktop
    nodejs
    pulsemixer
    flameshot
    chromium
    rofi
    dmenu
    onlyoffice-bin
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
  programs.git.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.bash.enable = true;
  

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.11";
}
