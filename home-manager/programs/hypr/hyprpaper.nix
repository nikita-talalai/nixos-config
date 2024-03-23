{ config, pkgs, ... }:

{
  home.packages = [ pkgs.hyprpaper ];

  home.file."${config.xdg.configHome}/hypr/hyprpaper.conf" = {
    enable = true;
    text = ''
      preload = ~/personal/github/nixos-config-2/wallpaper.png
      wallpaper = DP-1,~/personal/github/nixos-config-2/wallpaper.png
      wallpaper = HDMI-A-1,~/personal/github/nixos-config-2/wallpaper.png
      splash = true
    '';
  };
}
