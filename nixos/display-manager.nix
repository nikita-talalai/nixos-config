{ pkgs, ... }:

{
   services.xserver.enable = true;
   services.xserver = {
      displayManager.lightdm = {
         enable = true;
      };
      windowManager.hypr = {
         enable = true;
      };
   };

  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_session = {
  #       command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
  #       user = "greeter";
  #     };
  #   };
  # };
  #
  # environment.systemPackages = with pkgs; [
  #   greetd.tuigreet
  # ];
}
