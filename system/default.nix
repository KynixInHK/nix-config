# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib,... }:

{
  imports =
    [
      ../hosts/hardware-configuration.nix
      ../hosts/user.nix
      ../syspkgs
      ../modules/hyprland
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 5;

  networking.hostName = "code-station-nix";

  # Configure network proxy if necessary
  networking.proxy.default = "http://127.0.0.1:20171/";
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Taipei";

  # Select internationalisation properties.
  i18n.defaultLocale = "zh_TW.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_TW.UTF-8";
    LC_IDENTIFICATION = "zh_TW.UTF-8";
    LC_MEASUREMENT = "zh_TW.UTF-8";
    LC_MONETARY = "zh_TW.UTF-8";
    LC_NAME = "zh_TW.UTF-8";
    LC_NUMERIC = "zh_TW.UTF-8";
    LC_PAPER = "zh_TW.UTF-8";
    LC_TELEPHONE = "zh_TW.UTF-8";
    LC_TIME = "zh_TW.UTF-8";
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
	fcitx5-chinese-addons
    ];
  };

  services.xserver.desktopManager.runXdgAutostartIfNone = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable gc
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;

  # Enable sound
  sound.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable bluetooth and opengl
  hardware = {
    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Enable XDG integration and allow sway to use brillo
  #xdg = {
  #  portal = {
  #    enable = true;
  #    extraPortals = with pkgs; [
  #    xdg-desktop-portal-wlr
  #    xdg-desktop-portal-gtk
  #    ];
  #    gtkUsePortal = true;
  #  };
  #};

  # Fonts
  fonts = {
    packages = with pkgs; [
      jetbrains-mono
      roboto
      openmoji-color
      fira-mono
      work-sans
      comic-neue
      source-sans
      twemoji-color-font
      comfortaa
      inter
      lato
      dejavu_fonts
      iosevka-bin
      noto-fonts
      noto-fonts-cjk
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      sarasa-gothic
      source-han-sans
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    fontconfig = {
      hinting.autohint = true;
      defaultFonts = {
        monospace = [
          "JetbrainsMono"
          "Noto Color Emoji"
        ];
        sansSerif = [ "Source Han Sans" ];
        serif = [ "Noto Serif CJK SC" ];
	emoji = [ "Noto Color Emoji" ];
      };
    };
  };

  # TLP
  services.tlp.enable = true;

  # V2raya
  services.v2raya.enable = true;

  # Environment Variables
  environment.variables = {
    GDK_BACKEND = "x11";
    QT_QPA_PLATFORM="wayland";
    QT_WAYLAND_FORCE_DPI="144";
    PATH = [ 
      "/etc/nixos/scripts"
    ];
  };

  # Fish
  programs.fish.enable = true;

  security.pam.services.swaylock = {};

  system.stateVersion = "23.11";

  # Numlock
  systemd.services.numLockOnTty = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      # /run/current-system/sw/bin/setleds -D +num < "$tty";
      ExecStart = lib.mkForce (pkgs.writeShellScript "numLockOnTty" ''
        for tty in /dev/tty{1..6}; do
            ${pkgs.kbd}/bin/setleds -D +num < "$tty";
        done
      '');
    };
  };

  # Waydroid
  virtualisation.waydroid.enable = true;

  # Firewall
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 53 67 ];
  networking.firewall.allowedUDPPorts = [ 53 67 ];
  networking.firewall.extraCommands = ''
    iptables -P FORWARD ACCEPT
  '';
  networking.extraHosts = ''
    140.82.112.3 github.com
  '';

  # NTFS
  boot.supportedFilesystems = [ "ntfs" ];

  # Kernel Modules
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];

  # Nvidia
    # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = ["nvidia"];
  boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
  hardware.nvidia = {

    # Modesetting is required.
    modesetting.enable = true;

    powerManagement.enable = true;
    powerManagement.finegrained = true;

    # Use the NVidia open source kernel module (not to be confused with the
    # independent third-party "nouveau" open source driver).
    # Support is limited to the Turing and later architectures. Full list of 
    # supported GPUs is at: 
    # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
    # Only available from driver 515.43.04+
    # Currently alpha-quality/buggy, so false is currently the recommended setting.
    open = false;

    # Enable the Nvidia settings menu,
	# accessible via `nvidia-settings`.
    nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Prime
    prime.intelBusId = "PCI:0:2:0";
    prime.nvidiaBusId = "PCI:1:0:0";
    prime.offload = {
      enable = true;
      enableOffloadCmd = true;
    };
  };

  # Tomcat
  #services.tomcat = {
  #  enable = true;
  #  package = pkgs.tomcat10;
  #  webapps = [ /etc/nixos/modules/tomcat ];
  #};

  # Caddy
  services.caddy = {
  enable = true;
  virtualHosts."http://localhost" = {
    extraConfig = ''
      root    * /etc/nixos/modules/caddy/start_taiwan
      file_server
    '';
  };
};
}
