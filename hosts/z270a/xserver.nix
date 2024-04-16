{
  inputs,
  pkgs,
  lib,
  ...
}: let
  myxmonad = inputs.xmonad.packages.x86_64-linux.default;
  myxmobar = inputs.xmobar.packages.x86_64-linux.default;
in {
  services.xserver = {
    enable = true;

    layout = "us, ru";
    xkbOptions = "grp:lalt_lshift_toggle";

    displayManager = {
      lightdm.enable = true;
      sessionCommands = ''
        xrandr --output DP-1 --mode 1920x1080 --output HDMI-1 --mode 1920x1080 --primary --left-of DP-1
      '';
    };

    windowManager = {
      session = [
        {
          name = "xmonad";
          start = ''
            systemd-cat -t xmonad -- ${lib.getExe myxmonad} &
            waitPID=$!
          '';
        }
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    xorg.xev
    myxmonad
    myxmobar
  ];
}
