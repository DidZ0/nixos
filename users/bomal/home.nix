{ inputs, lib, config, pkgs, ... }: {

  imports = [
    ./programs/foot.nix
    ./programs/waybar.nix
    ./programs/git.nix
    ./programs/taskwarrior.nix
  ];

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
    teams-for-linux
    hyprpaper
    hyprlock
    hypridle
    wofi
    nnn
    pulsemixer
    btop
    htop
    neofetch
    neovim
    vscode-fhs
    chromium
    ripgrep
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

  programs.bash = {
    enable = true;
    initExtra = ''
	. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    '';
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.bash.shellAliases = {
    switch = "home-manager switch --flake $HOME/.config/nixos";
    nixoswitch = "sudo nixos-rebuild switch --flake $HOME/.config/nixos";
  };
  
  xdg.configFile."hypr/hyprland.conf".source = ./hypr/hyprland.conf;
  xdg.configFile."hypr/hyprpaper.conf".source = ./hypr/hyprpaper.conf;
  xdg.configFile."hypr/hyprlock.conf".source = ./hypr/hyprlock.conf;
  xdg.configFile."hypr/hypridle.conf".source = ./hypr/hypridle.conf;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
