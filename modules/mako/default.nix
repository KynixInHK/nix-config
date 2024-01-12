{ pkgs, ... }:

{
  xdg.configFile = {
    "mako/config" = {
      source = ./config;
      force = true;
    };
  };
}
