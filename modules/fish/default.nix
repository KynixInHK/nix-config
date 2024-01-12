{ pkgs, ... }:

{
  home.file.".config/fish/functions".source = ./functions;
  home.file.".config/fish/config.fish".source = ./config.fish;
  home.file.".config/fish/fish_variables".source = ./fish_variables;
}
