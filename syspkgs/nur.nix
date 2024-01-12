{ pkgs, ... }:

let
  nur-no-pkgs = import (builtins.fetchTarball {
    url = "https://github.com/nix-community/NUR/archive/master.tar.gz";
    sha256 = "sha256:1rh1qdys94wpdyjhxlp90367824mbg2ch8icin27kg104vr3cdiq";
  }) { inherit pkgs; };

  #nix_pkgs = import <nixpkgs> { inherit pkgs; };
in

{
  home.packages = with pkgs; [
    nur.repos.xddxdd.qqmusic
    nur.repos.xddxdd.bilibili
  ];
}
