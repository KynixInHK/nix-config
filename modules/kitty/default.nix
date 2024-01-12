{ config, pkgs, lib, home-manager, ... }:

{
  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./kitty.conf;
  };
  
}
