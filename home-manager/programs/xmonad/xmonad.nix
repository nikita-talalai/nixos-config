{ inputs, pkgs, ... }:

{
  xsession.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    config = ./xmonad.hs;
    extraPackages = haskellPackages: [
      inputs.east-gate.packages.${pkgs.system}.default
    ];
  };

  programs.xmobar = {enable = true;};
}
