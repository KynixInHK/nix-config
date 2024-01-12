{ config, lib, pkgs, ... }:

let
  inherit (config.lib.formats.rasi) mkLiteral;
  rofi-theme = {
      "*" = {
        background = mkLiteral "#24273a";
        background-alt = mkLiteral "#24273a";
        foreground = mkLiteral "#cad3f5";
        selected = mkLiteral "#8aadf4";
        active = mkLiteral "#8aadf4";
        urgent = mkLiteral "#6e738d";
      };
      "window" = {
        transparency = "real";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        fullscreen = mkLiteral "false";
        width = mkLiteral "900px";
        x-offset = mkLiteral "0px";
        y-offset = mkLiteral "0px";
        enabled = mkLiteral "true";
        border-radius = mkLiteral "20px";
        border = mkLiteral "4px";
        border-color = mkLiteral "#414559";
        cursor = "default";
        background-color = mkLiteral "@background";
      };
      "mainbox" = {
        enabled = true;
        spacing = mkLiteral "0px";
        background-color = mkLiteral "transparent";
        orientation = mkLiteral "vertical";
        children = mkLiteral "[inputbar,listbox]";
      };
      "listbox" = {
        spacing = mkLiteral "15px";
        padding = mkLiteral "15px 15px 15px 22.5px";
        background-color = mkLiteral "transparent";
        orientation = mkLiteral "vertical";
        children = mkLiteral "[message,listview]";
      };
      "inputbar" = {
        enabled = true;
        spacing = mkLiteral "15px";
        padding = mkLiteral "45px 30px 45px 30px";
        background-color = mkLiteral "@selected";
        text-color = mkLiteral "@foreground";
        orientation = mkLiteral "horizontal";
        children = mkLiteral "[prompt,entry]";
      };
      "entry" = {
        enabled = true;
        expand = true;
        width = mkLiteral "450px";
        padding = mkLiteral "18px 22.5px";
        border-radius = mkLiteral "15px";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "text";
        placeholder = "Search";
        placeholder-color = mkLiteral "inherit";
      };
      "prompt" = {
        width = mkLiteral "96px";
        font = "Jetbrains Mono 20";
        padding = mkLiteral "15px 30px 15px 30px";
        border-radius = mkLiteral "15px";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "pointer";
      };
      "mode-switcher" = {
        enabled = true;
        spacing = mkLiteral "15px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
      };
      "button" = {
        width = mkLiteral "72px";
        font = "Jetbrains Mono 21";
        padding = mkLiteral "12px 7.5px 12px 12px";
        border-radius = mkLiteral "15px";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "pointer";
      };
      "button selected" = {
        background-color = mkLiteral "@selected";
        text-color = mkLiteral "@foreground";
      };
      "listview" = {
        enabled = true;
        columns = 2;
        lines = 7;
        cycle = true;
        dynamic = true;
        srollbar = false;
        layout = mkLiteral "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = false;
        spacing = mkLiteral "7.5px";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        cursor = mkLiteral "default";
      };
      "element" = {
        enabled = true;
        spacing = mkLiteral "22.5px";
        padding = mkLiteral "10.5px";
        border-radius = mkLiteral "5%";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        cursor = mkLiteral "pointer";
      };
      "element normal.normal" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };
      "element normal.urgent" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@foreground";
      };
      "element normal.active" = {
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@active";
      };
      "element selected.normal" = {
        background-color = mkLiteral "@selected";
        text-color = mkLiteral "@foreground";
      };
      "element selected.urgent" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@foreground";
      };
      "element selected.active" = {
        background-color = mkLiteral "@urgent";
        text-color = mkLiteral "@active";
      };
      "element-icon" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        size = mkLiteral "48px";
        cursor = mkLiteral "inherit";
      };
      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
      };
      "message" = {background-color = mkLiteral "transparent";};
      "textbox" = {
        padding = mkLiteral "18px";
        border-radius = mkLiteral "100%";
        background-color = mkLiteral "@background-alt";
        text-color = mkLiteral "@foreground";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
      };
      "error-message" = {
        padding = mkLiteral "18px";
        border-radius = mkLiteral "20px";
        background-color = mkLiteral "@background";
        text-color = mkLiteral "@foreground";
      }; 
  };

in

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "Jetbrains Mono 20";
    theme = rofi-theme;
  };
}

