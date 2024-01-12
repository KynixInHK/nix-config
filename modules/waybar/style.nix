''
  * {
    font-family: Material Design Icons, Iosevka Nerd Font;
  }
  window#waybar {
    background-color: #24273a;
    border-radius: 15px;
    color: #1e2030;
    font-size: 30px;
    transition-duration: 0.5s;
    padding: 10px;
  }
  window#waybar.hidden {
    opacity: 0.2;
  }
  #workspaces {
    font-size: 20px;
    background-color: #414559;
    color: #ffffff;
    margin-left: 15px;
    margin-right: 15px;
    margin-top: 10px;
    border-radius: 20px;
  }

  #workspaces button.persistent {
    background-color: #414559;
  }

  #workspaces button {
    margin-top: 15px;
    margin-bottom: 15px;
    margin-left: 15px;
    margin-right: 15px;
    background-color: #81859A;
    color: #ffffff;
    border-radius: 20px;
  }

  #workspaces button.active {
    background-color: #ffffff;
    color: #ffffff;
    border-radius: 20px;
  }

  #workspaces button.urgent {
    background-color: #414559;
    color: #9F0000;
    border-radius: 20px;
  }

  #custom-launch {
    background-image: url("${./nix.svg}");
    background-size: 50%;
    background-position: center;
    background-repeat: no-repeat;
    background-color: #414559;
    color: #ffffff;
    border-radius: 20px;
    padding-top: 12px;
    padding-bottom: 12px;
    margin-left: 15px;
    margin-right: 15px;
    margin-top: 10px;
  }

  #custom-lock {
    font-size: 35px;
    background-color: #414559;
    border-radius: 20px;
    padding-bottom: 10px;
    padding-top: 10px;
    margin-left: 15px;
    margin-right: 15px;
    margin-top: 10px;
    color: #97c7ff;
  }

  #clock {
    color: #ffffff;
    background-color: #414559;
    margin-bottom: 10px;
    margin-left: 15px;
    margin-right: 15px;
    border-radius: 20px;
    padding-top: 10px;
    padding-bottom: 10px;
  }

  #battery {
    font-size: 35px;
    background-color: #414559;
    border-radius: 20px;
    padding-bottom: 10px;
    padding-top: 10px;
    margin-bottom: 10px;
    margin-left: 15px;
    margin-right: 15px;
    color: #a6d189;
  }
  #battery.warning {
    color: #ef9f76;
  }
  #battery.critical:not(.charging) {
    color: #e78284;
  }

  #network {
    font-size: 35px;
    background-color: #414559;
    border-radius: 20px;
    padding-bottom: 10px;
    padding-top: 10px;
    padding-right: 9px;
    margin-bottom: 10px;
    margin-left: 15px;
    margin-right: 15px;
    color: #FFD18C;
  }

  #network.disconnected {
    color: #e78284;
  }

  #network.disabled {
    color: #e78284;
  }

  #pulseaudio {
    font-size: 35px;
    background-color: #414559;
    border-radius: 20px;
    padding-bottom: 10px;
    padding-top: 10px;
    margin-bottom: 10px;
    margin-left: 15px;
    margin-right: 15px;
    color: #B1A5FF;
  }

  #pulseaudio.muted {
    color: #e78284;
  }

  #backlight {
    font-size: 35px;
    background-color: #414559;
    border-radius: 20px;
    padding-bottom: 10px;
    padding-top: 10px;
    margin-bottom: 10px;
    margin-left: 15px;
    margin-right: 15px;
    color: #FFFF00;
  }
''
