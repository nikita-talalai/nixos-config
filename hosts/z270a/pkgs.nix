{pkgs, inputs, ...}: {
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
    dmenu-bluetooth
    inputs.xmobar.packages.x86_64-linux.default
  ];
}
