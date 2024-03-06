{ pkgs, ... }:

{
   home.packages = with pkgs;
   [
      alacritty
      zsh
      fastfetch
      neovim
      firefox
      telegram-desktop
      waybar
   ];
}
