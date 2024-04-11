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

  home.packages = [
    inputs.xmobar.packages.x86_64-linux.default
  ];

}
