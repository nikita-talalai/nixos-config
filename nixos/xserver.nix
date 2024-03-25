{
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

    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };
  };
}
