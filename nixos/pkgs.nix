{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    curl
    wl-clipboard
    git
    pamixer
    pavucontrol

    ltrace
    file
  ];
}
