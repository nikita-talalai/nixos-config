{
  inputs,
  ...
}: {
  imports = [
    ./programs
    ./pkgs.nix
    ./theme.nix
    ./scripts
  ];

  nixpkgs = {
    overlays = [inputs.nvim.overlays.default];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "nikita";
    homeDirectory = "/home/nikita";
  };

  systemd.user.startServices = "sd-switch";

  programs.home-manager.enable = true;
  home.stateVersion = "23.11";
}
