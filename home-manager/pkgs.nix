{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
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
    jq
    inputs.nvim.packages.x86_64-linux.nvim
  ];
}
