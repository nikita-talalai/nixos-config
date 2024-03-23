{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver = {
    displayManager.lightdm = { enable = true; };
    windowManager.hypr = { enable = true; };
  };
}
