{ config, lib, ... }:

{
   programs.alacritty = {
      enable = true;
      settings = {

         # window.opacity = 0.7;
         # window.blur = true;

         font.size = 30;
         # font.size = lib.mkForce 20;

         cursor.style = "Beam";
         cursor.blinking = "Off";

         selection.save_to_clipboard = true;
      };
   };
}
