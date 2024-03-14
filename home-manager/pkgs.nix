{ pkgs, inputs, ... }:

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
      inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.hyprshot
   ];
}
