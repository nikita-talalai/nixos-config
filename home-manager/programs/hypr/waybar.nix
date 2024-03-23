{ config, pkgs, ... }:

{
  home.packages = [ pkgs.waybar ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        height = 30;
        output = "HDMI-A-1";
        margin-left = 10;
        modules-center =
          [ "pulseaudio#percentage" "clock" "clock#date" "clock#time" ];
        "pulseaudio#percentage" = { format = "{volume}"; };
        "clock" = {
          format = "{:%a}";
          "tooltip-format" = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };
        "clock#date" = {
          "format" = "{:%d}";
          "tooltip-format" = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
        };
        "clock#time" = {
          "format" = ''
            {:%H
            %M}'';
        };
      };
    };
    style = ''
      * {
         font-family:'Monospace','tabler-icons';
         padding-left: 3px;
         padding-right: 3px;
      }

      window#waybar {
         background: transparent;
      }

      tooltip {
         background: #FFFFFF;
         border-radius: 15px;
         border-width: 2px;
         border-style: solid;
         border-color: #FFFFFF;
         font-size: 20px;
      }

      tooltip label {
         padding: 7px;
      }

      #workspaces {
         background: #FFFFFF;
         font-size: 18pt;
         padding-top: 20px;
         border-top-left-radius: 15px;
         border-top-right-radius: 15px;
         padding-bottom: 10px;
      }

      #workspaces button {
         color: #dcd7ba;
         padding-top: 10px;
         padding-bottom: 10px;
      }

      #workspaces button.focused {
         color: #7e9cd8;
      }

      #workspaces button.active {
         color: #7e9cd8;
      }

      #workspaces button.urgent {
         color: #e6c384;
      }

      #workspaces button:hover {
         background: #FFFFFF;
         border-color: #FFFFFF;
         color: #7e9cd8;
      }

      #pulseaudio.percentage, #clock.date, #clock.time {
         background: #272822;
         border: solid;
         border-width: 4px;
         border-color: #FFFFFF;
         border-radius: 0px;
      }

      #pulseaudio.percentage {
         font-size: 20px;
         padding-top: 10px;
         padding-bottom: 10px;
         color: #FFFFFF;
         border-top-left-radius: 15px;
         border-top-right-radius: 15px;
      }

      #clock {
         padding-top: 10px;
         font-size: 20px;
         color: #FFFFFF;
      }

      #clock.date {
         padding-top: 1px;
         font-size: 20px;
         padding-bottom: 10px;
         color: #FFFFFF;
      }


      #clock.time {
         padding-top: 10px;
         padding-bottom: 20px;
         font-size: 20px;
         border-bottom-left-radius: 15px;
         border-bottom-right-radius: 15px;
         color: #FFFFFF;
      }
    '';
  };
}
