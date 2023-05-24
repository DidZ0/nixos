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
    neovim
    vscode
    logseq
    signal-desktop
    nodejs
    pulsemixer
    flameshot
    chromium
    rofi
    dmenu
  ];

  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.11";
}
