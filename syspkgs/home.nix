{ config, pkgs, inputs, ... }:

# Home Manager pkgs.
{ 
    home.packages = with pkgs; [
      neofetch
      nnn
    
      # Archives
      zip
      xz
      unzip
      p7zip

      # systools
      tree
      which
      gnupg
      ncdu

      # hyprland
      xfce.thunar
      microsoft-edge
      rofi-wayland
      swaybg
      swaylock-effects
      swayidle
      brightnessctl
      pamixer
      sutils

      # apps
      gimp # (pkgs.wrapGAppsHook.override { gappsWrapperArgs = [ "--set GDK_BACKEND wayland" ]; })
      obs-studio
      v2raya

      # fonts
      font-awesome
      cascadia-code

      jq
      grim
      slurp
      wl-clipboard

      # config
      qq
      teams-for-linux
      localsend
      
      # IDE
      jetbrains.idea-ultimate
      termius
      vscode-with-extensions

    ];
  }
