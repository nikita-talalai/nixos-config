{ pkgs, ... }:

{
   home.packages = with pkgs;
   [
      fastfetch
      neovim
      firefox
      telegram-desktop
      fzf
      ripgrep-all
      haskellPackages.kmonad
   ];
}
