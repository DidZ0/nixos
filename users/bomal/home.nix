{ inputs, lib, config, pkgs, ... }: {

  imports = [
    ./wezterm
    ./programs/foot.nix
  ];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  programs.home-manager.enable = true;
  programs.kitty = {
    enable = true;
    settings = { confirm_os_window_close = -1; };
  };

  home.username = "bomal";
  home.homeDirectory = "/home/bomal";

  home.packages = with pkgs; [
    signal-desktop
    flameshot
    neovim
    hyprpaper
    wofi
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
    userEmail = "sub@yan-imensar.fr";
  };

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
