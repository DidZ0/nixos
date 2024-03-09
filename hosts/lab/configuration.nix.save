{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.extraOptions = ''
    keep-outputs = true
    keep-derivations = true
  '';

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;
  
  networking.hostName = "lab";
  networking.networkmanager.enable = true;

  services.gnome.gnome-keyring.enable = true;

  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };


  users.users.bomal = {
    isNormalUser = true;
    description = "Yan IMENSAR";
    extraGroups = [ "networkmanager" "wheel" "video"];
    packages = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
    rofi
    st
    alacritty
    nitrogen
    networkmanagerapplet
    networkmanager-openvpn
    netbird-ui
  ];

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "intl";
    desktopManager.xterm.enable = true;
    displayManager.defaultSession = "none+qtile";
    windowManager.qtile.enable = true;
  };

  services.netbird.enable = true; # for netbird service & CLI

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.11";
}
