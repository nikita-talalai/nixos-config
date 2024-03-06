{ pkgs, stylix, ... }:

{
   stylix.autoEnable = true;
   stylix.image = ../wallpaper.png;
   stylix.fonts.monospace = {
      package = pkgs.nerdfonts;
      name = "Hack";
   };
   stylix.fonts.sizes.terminal = 20;
}

# let
#    opacity = 0.7;
#    font-size = 11;
#    terminal-font-size = 30;
# in
# {
#    stylix.autoEnable = true;
#
#    stylix.polarity = "dark";
#
#    stylix.opacity = {
#       terminal = opacity;
#       popups = opacity;
#    };
#
#    stylix.fonts = {
#       serif = {
#          package = pkgs.nerdfonts;
#          name = "Hack";
#       };
#       sansSerif = {
#          package = pkgs.nerdfonts;
#          name = "Hack";
#       };
#       monospace = {
#          package = pkgs.nerdfonts;
#          name = "FiraMono";
#       };
#       sizes = {
#          applications = font-size;
#          desktop = font-size;
#          popups = font-size;
#          terminal = terminal-font-size;
#       };
#    };
# }


