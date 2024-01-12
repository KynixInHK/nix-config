{ config, pkgs, ... }: {
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    curl
    acpi
    tlp
    kitty
    xorg.xrdb
    xdg-utils

    lxappearance
    papirus-folders
    papirus-icon-theme
    virtualenv
    python3
    orchis-theme
    materia-theme
    material-icons
    material-design-icons
    
    termius
    tela-icon-theme
    numix-icon-theme-circle
    numix-icon-theme-circle

    kbd

    libnotify
    mako

  ];
}
