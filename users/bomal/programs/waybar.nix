{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false; # disable it,autostart it in hyprland conf
      target = "graphical-session.target";
    };
    style = ''
      * {
        font-family: "FiraCode Nerd Font";
        font-size: 12pt;
        font-weight: bold;
        border-radius: 0px;
        transition-property: background-color;
        transition-duration: 0.5s;
      }
      @keyframes blink_red {
        to {
          background-color: rgb(242, 143, 173);
          color: rgb(26, 24, 38);
        }
      }
      .warning, .critical, .urgent {
        animation-name: blink_red;
        animation-duration: 1s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }
      window#waybar {
        background-color: transparent;
      }
      window > box {
        /* margin-left: 5px;
        margin-right: 5px;
        margin-top: 5px; */
        background-color: rgb(0, 0, 0);
      }
      #workspaces {
        padding-left: 0px;
        padding-right: 4px;
      }
      #workspaces button {
        padding-top: 5px;
        padding-bottom: 5px;
        padding-left: 6px;
        padding-right: 6px;
        color:#D8DEE9;
      }
      #workspaces button.active {
        background-color: rgb(181, 232, 224);
        color: rgb(26, 24, 38);
      }
      #workspaces button.urgent {
        color: rgb(26, 24, 38);
      }
      #workspaces button:hover {
        background-color: #B38DAC;
        color: rgb(26, 24, 38);
      }
      tooltip {
        background: rgb(48, 45, 65);
      }
      tooltip label {
        color: rgb(217, 224, 238);
      }
      #custom-launcher {
        padding-left: 8px;
        padding-right: 6px;
        color: rgb(201, 203, 255);
      }
      #window, #backlight, #clock, #memory,#battery, #cpu, #pulseaudio, #network {
        padding-left: 10px;
        padding-right: 10px;
      }
      #memory {
        color: rgb(181, 232, 224);
      }
      #cpu {
        color: rgb(245, 194, 231);
      }
      #clock {
        color: rgb(217, 224, 238);
      }
      #pulseaudio {
        color: rgb(245, 224, 220);
      }
      #battery{
        color: rgb(181, 133, 71);
      }
      #network {
        color: #ABE9B3;
      }
      #backlight{
        color: #ABE9B3;
      }

      #network.disconnected {
        color: rgb(255, 255, 255);
      }
      #tray {
        padding-right: 8px;
        padding-left: 10px;
      }
      #window {
        opacity: 0.5;
        color: #414868;
        font-style: italic;
        font-size: 10pt;
      }
    '';
    settings = [{
      "layer" = "top";
      "position" = "top";
      modules-left =
        [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ "clock" ];
      modules-right = [ "backlight" "pulseaudio" "memory" "cpu" "battery" "network" "tray" ];
      "hyprland/workspaces" = {
        "format" = "{name}";
        "on-click" = "activate";
      };
      "backlight"= {
      	"on-scroll-up"="light -A 5";
      	"on-scroll-down"="light -U 5";
        "device"= "intel_backlight";
        "format"= "{icon} {percent}%";
        "format-icons"= ["" ""];
      };
      "pulseaudio" = {
        "scroll-step" = 1;
        "format" = "{icon} {volume}%";
        "format-muted" = "󰖁 Muted";
        "format-icons" = { "default" = [ "" "" "" ]; };
        "on-click" = "foot -e pulsemixer";
        "tooltip" = false;
      };
      "clock" = {
        "interval" = 5;
        "format" = "{:%I:%M}";
      };
      "memory" = {
        "interval" = 1;
        "format" = "󰍛 {percentage}%";
        "states" = { "warning" = 85; };
        "on-click" = "foot -e htop";
      };
      "cpu" = {
        "interval" = 1;
        "format" = "󰻠 {usage}%";
        "on-click" = "foot -e htop";
      };
      "battery" = {
        "interval" = 60;
	"states" = {
	  "good" = 95;
	  "warning" = 30;
	  "critical" = 5;
	};
	"format-charging" = " {capacity}%";
	"format-plugged" = " {capacity}%";
	"format" = "{icon} {capacity}%";
    	"format-icons"= ["" "" "" "" ""];
        };
      "network" = {
        "format-disconnected" = "󰯡 Disconnected";
        "format-ethernet" = "󰀂 {ifname}";
        "format-linked" = "󰖪 {essid} (No IP)";
        "format-wifi" = "󰖩 {essid}";
        "interval" = 4;
        "tooltip" = false;
        "on-click" = "foot -e nmtui";
      };
      "tray" = {
        "icon-size" = 20;
        "spacing" = 5;
      };
    }];
  };
}
