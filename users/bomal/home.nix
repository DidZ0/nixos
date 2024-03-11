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
    neovim
    hyprpaper
    wofi
    pulsemixer
    btop
    neofetch
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

  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];

  programs.bash = {
    enable = true;
    initExtra = ''
	. "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    '';
  };

  programs.vscode.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.bash.shellAliases = {
    switch = "home-manager switch --flake $HOME/.config/nixos";
    nixoswitch = "sudo nixos-rebuild switch --flake $HOME/.config/nixos";
  };
  
  xdg.configFile."hypr/hyprland.conf".source = ./hypr/hyprland.conf;
  xdg.configFile."hypr/hyprpaper.conf".source = ./hypr/hyprpaper.conf;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.11";
}
