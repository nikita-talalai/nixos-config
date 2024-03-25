{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    curl
    wl-clipboard
    xclip
    git
    pamixer
    pavucontrol

    ltrace
    file
  ];
}
