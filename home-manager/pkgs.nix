{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}: 
{
  home.packages = with pkgs; [
    fastfetch
    firefox
    telegram-desktop
    ripgrep-all
    ripgrep
    inputs.nixpkgs-unstable.legacyPackages.x86_64-linux.hyprlock
    wf-recorder
    slurp
    mpv
    grim
    imv
    swappy
    jq
    inputs.nvim.packages.x86_64-linux.nvim
    scrot
    qbittorrent
    vlc
    xcolor
    weechat
    rclone
    p7zip
    busybox
    # archivebox
    syncthing
  ]
  ++ [
    pkgs-unstable.obsidian
  ];
}
