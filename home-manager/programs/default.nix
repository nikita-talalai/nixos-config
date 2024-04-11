{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
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
  ];
}
