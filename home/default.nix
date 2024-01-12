{ config, pkgs, nixpkgs, home-manager, hyprland, inputs, ... }: {
  
  # imports
  imports = [
    ../syspkgs/home.nix
    ../modules/hyprland/hyprland.nix
    ../modules/kitty
    ../modules/rofi
    ../modules/waybar
    ../modules/fcitx5
    ../modules/mako
    ../modules/fish
    ../modules/neofetch
    ../syspkgs/nur.nix
  ];
  
  home.username = "kynix";
  home.homeDirectory = "/home/kynix";
  home.enableNixpkgsReleaseCheck = false;
  
  # xcursor and xft; compatible with 2.5K screen.
  xresources.properties = {
     "Xcursor.size" = 16;
     "Xft.dpi" = 144;
  };

  # Git
  programs.git = {
    enable = true;
    userName = "KynixInHK";
    userEmail = "kynixcn@gmail.com";
  };

  # Version
  home.stateVersion = "23.11";

  # Let home manager install and manage itself.
  programs.home-manager.enable = true; 
}
