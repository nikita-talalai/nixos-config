{pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [
    vim
    curl
    wl-clipboard
    xclip
    git
    pamixer
    pavucontrol
    binutils
    coreutils

    ltrace
    file
    dmenu-bluetooth
    inputs.xmobar.packages.x86_64-linux.default
  ];
}
