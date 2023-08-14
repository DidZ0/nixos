{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  networking.hostName = "worklap";
  networking.networkmanager.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

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

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    chromium
    rofi
    st
    nitrogen
    networkmanagerapplet
    networkmanager-openvpn
    tailscale
  ];

  fonts.fonts = with pkgs; [
    noto-fonts
    roboto
    arkpandora_ttf
    liberation_ttf
  ];

  # enable the tailscale service
  services.tailscale.enable = true;

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "colemak";
    windowManager.qtile.enable = true;
    desktopManager.xterm.enable = false;
    displayManager.lightdm.enable = true;
    displayManager.defaultSession = "none+qtile";
    libinput.enable = true;
  };

  programs.light.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  virtualisation.docker.enable = true;

  system.stateVersion = "22.11";
}
