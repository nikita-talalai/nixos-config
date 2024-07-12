{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = { "application/pdf" = "org.pwmt.zathura.desktop"; };
  };

  imports = [
    ./hypr
    ./lazygit.nix
    ./git.nix
    ./zsh.nix
    ./rofi.nix
    ./dunst.nix
    ./zathura.nix
    ./alacritty.nix
    ./fzf.nix
    ./eza.nix
    ./swappy.nix
    ./zoxide.nix
    ./tmux
    ./lf.nix
    ./gdb.nix
    ./direnv
  ];
}
