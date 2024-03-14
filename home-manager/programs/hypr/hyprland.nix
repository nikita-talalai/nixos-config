{ config, pkgs, hyprland, ...}:

{
   home.packages = with pkgs; [
      hyprpicker
   ];

   wayland.windowManager.hyprland = {
      enable = true;
      settings = {

         env = [
            "XCURSOR_THEME,Bibata-Modern-Ice"
            "XCURSOR_SIZE,24"
            "QT_QPA_PLATFORMTHEME,qt5ct"
            "NIXOS_CONFIG,/home/nikita/personal/github/nixos-config/"
         ];

         monitor = [
            "HDMI-A-1, 1920x1080, 0x0, 1"
            "DP-1, 1920x1080, 1920x0, 1"
         ]; 

         workspace = [
            "1, monitor:HDMI-A-1"
            "2, monitor:HDMI-A-1"
            "3, monitor:HDMI-A-1"
            "4, monitor:DP-1"
            "5, monitor:DP-1"
         ];

         exec-once = [
            "hyprpaper"
         ];

         input = {
            kb_layout = "us, ru";
            kb_options = "grp:alt_shift_toggle";
            follow_mouse = 0;
            sensitivity = 0;
         };

         general = {
            gaps_in = 5;
            gaps_out = 20;
            border_size = 2;
            "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
            "col.inactive_border" = "rgba(595959aa)";
            resize_on_border = true;
            layout = "dwindle";

            # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
            allow_tearing = false;
         };

         decoration = {
            rounding = 10;
            blur = {
               enabled = true;
               size = 3;
               passes = 1;
            };
            drop_shadow = "yes";
            shadow_range = 4;
            shadow_render_power = 3;
            "col.shadow" = "rgba(1a1a1aee)";
         };

         animations = {
            enabled = "yes";
            bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
            animation = [
               "windows, 1, 7, myBezier"
               "windowsOut, 1, 7, default, popin 80%"
               "border, 1, 10, default"
               "borderangle, 1, 8, default"
               "fade, 1, 7, default"
               "workspaces, 1, 6, default"
             ];
         };

         dwindle = {
            pseudotile = "yes";
            preserve_split = "yes";
         };

         master = {
            new_is_master = true;
         };

         gestures = {
            workspace_swipe = "off";
         };

         misc = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more
            force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
         };

         "$mainMod" = "SUPER";
         "$terminal" = "alacritty";
         "$browser" = "firefox";

         bind = [
            "$mainMod, T, exec, $terminal"
            "$mainMod, B, exec, $browser"
            "$mainMod, Q, killactive"
            "$mainMod, E, exit"
            "$mainMod, V, togglefloating"
            "$mainMod, P, pseudo"
            "$mainMod, J, togglesplit"

            "$mainMod, left, movefocus, l"
            "$mainMod, right, movefocus, r"
            "$mainMod, up, movefocus, u"
            "$mainMod, down, movefocus, d"

            "$mainMod, 1, workspace, 1"
            "$mainMod, 2, workspace, 2"
            "$mainMod, 3, workspace, 3"
            "$mainMod, 4, workspace, 4"
            "$mainMod, 5, workspace, 5"
            "$mainMod, 6, workspace, 6"
            "$mainMod, 7, workspace, 7"
            "$mainMod, 8, workspace, 8"
            "$mainMod, 9, workspace, 9"
            "$mainMod, 0, workspace, 10"

            "$mainMod SHIFT, 1, movetoworkspace, 1"
            "$mainMod SHIFT, 2, movetoworkspace, 2"
            "$mainMod SHIFT, 3, movetoworkspace, 3"
            "$mainMod SHIFT, 4, movetoworkspace, 4"
            "$mainMod SHIFT, 5, movetoworkspace, 5"
            "$mainMod SHIFT, 6, movetoworkspace, 6"
            "$mainMod SHIFT, 7, movetoworkspace, 7"
            "$mainMod SHIFT, 8, movetoworkspace, 8"
            "$mainMod SHIFT, 9, movetoworkspace, 9"
            "$mainMod SHIFT, 0, movetoworkspace, 1"

            "$mainMod, PRINT, exec, hyprshot -m window --clipboard-only"
            ", PRINT, exec, hyprshot -m output --clipboard-only"
            "$shiftMod, PRINT, exec, hyprshot -m region --clipboard-only"

         ];

         bindm = [
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
         ];

         windowrulev2 = [
            # "float,class:^firefox$"
            # "nofullscreenrequest,class:^firefox$"
            # "nomaximizerequest, class:.*"
             "nomaxsize, class:.*"
         ];
      };
   };
}
