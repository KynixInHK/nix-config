{ pkgs, lib, config, ... }:

{
  home.file.".config/waybar/style.css".text = import ./style.nix;
  home.packages = with pkgs; [ waybar ];
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
	layer = "top";
	position = "left";
	width = 100;
        margin-top = 20;
	margin-bottom = 20;
	margin-left = 20;
	spacing = 12;
	modules-left = [
	  "custom/launch"
	  "custom/lock"
	  "hyprland/workspaces"
	];

	modules-center = [];

	modules-right = [
	  "battery"
	  "backlight"
	  "pulseaudio"
	  "network"
	  "clock"
	];

	"hyprland/workspaces" = {
	  on-click = "activate";
	  format = "{icon}";
	  active-only = false;
	  persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
            "7" = [];
            "8" = [];
            "9" = [];
            "0" = [];
	  };
          format-icons = {
	    default = "";
	    active = "";
	    urgent = "";
	  };
	};
	
	"custom/launch" = {
	  format = "{icon}";
	  format-icons = " ";
	  tooltip = false;
	};

        "custom/lock" = {
	  format = "{icon}";
	  format-icons = "󰌾";
	  tooltip = false;
	  on-click = "sh -c 'swaylock -C /etc/nixos/modules/hyprland/swaylock.conf'";
        };

	battery = {
	  bat = "BAT0";
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}";
          format-charging = "󰂄";
          format-plugged = "󰚥";
          format-alt = "{icon}";
          format-icons = [ "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁽" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
        };

	network = {
	  format = "{icon}";
          format-wifi = "󰖩";
          format-ethernet = "󰈀";
          format-alt = "󰖩";
          format-disconnected = "󱚼";
          tooltip-format =
            "{ipaddr}/{ifname} via {gwaddr} ({signalStrength}%)";
        };

	pulseaudio = {
	  format = "{icon}";
	  format-muted = "󰖁";
	  format-bluetooth = "󰂰";
	  format-icons = {
	    default = [ "󰕿" "󰖀" "󰕾" ];
	    headphone = "󱡏";
	  };
	  reverse-scrolling = true;
	};

	backlight = {
          format = "{icon}";
          format-icons = [ "" "" "" "" "" "" "" "" "" ];
	  reverse-scrolling = true;
        };

	clock = {
	  format = ''
            {:%H
            %M}'';
	  timezone = "Asia/Taipei";
	  #tooltip-format = "<tt><small>{calendar}</small></tt>";
          #calendar = {
          #  mode = "year";
          #  mode-mon-col = 3;
          #  weeks-pos = "right";
          #  on-scroll = 1;
          #  on-click-right = "mode";
          #  format = {
          #    months = "<span color='#ffead3'><b>{}</b></span>";
          #    days = "<span color='#ecc6d9'><b>{}</b></span>";
          #    weeks = "<span color='#99ffdd'><b>W{}</b></span>";
          #    weekdays = "<span color='#ffcc66'><b>{}</b></span>";
          #    today = "<span color='#ff6699'><b><u>{}</u></b></span>";
          #  };
          #};
          #actions = {
          #  on-click-right = "mode";
          #  on-click-forward = "tz_up";
          #  on-click-backward = "tz_down";
          #  on-scroll-up = "shift_up";
          #  on-scroll-down = "shift_down";
          #};
	};
      };
    };
  };
}
