{ pkgs, ... }:

{
  home.file.".local/share/fcitx5/themes".source = ./themes;
  xdg.configFile = {
    "fcitx5/profile" = {
      source = ./profile;
      force = true;
    };
    "fcitx5/config" = {
      source = ./config;
      force = true;
    };
    "fcitx5/conf/classicui.conf" = {
      source = ./conf/classicui.conf;
      force = true;
    };

    "fcitx5/conf/pinyin.conf" = {
      source = ./conf/pinyin.conf;
      force = true;
    };

    "fcitx5/conf/chttrans.conf" = {
      source = ./conf/chttrans.conf;
      force = true;
    };

    "fcitx5/conf/notifications.conf" = {
      source = ./conf/notifications.conf;
      force = true;
    };

    "fcitx5/conf/punctuation.conf" = {
      source = ./conf/punctuation.conf;
      force = true;
    };
  };
}
