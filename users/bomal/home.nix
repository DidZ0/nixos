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
    vscode
    logseq
    signal-desktop
    nodejs
    pulsemixer
    flameshot
  ];

  programs.home-manager.enable = true;
  programs.git.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "22.11";
}