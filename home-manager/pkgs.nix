{ pkgs, inputs, ... }:

{
   home.packages = with pkgs;
   [
      fastfetch
      neovim
      firefox
      telegram-desktop
      ripgrep-all
      haskellPackages.kmonad
      inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.hyprlock
      wf-recorder
      slurp
      mpv
      grim
      imv
      swappy
   ];
}
