{ pkgs, ... }:

{
  xdg.configFile."neofetch/config.conf" = {
    source = ./config.conf;
    force = true;
  };
}
