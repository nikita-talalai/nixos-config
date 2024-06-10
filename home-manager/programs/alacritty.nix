{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.7;
      window.blur = true;

      font.size = 15;

      cursor.style = "Beam";

      selection.save_to_clipboard = true;

      env.TERM = "xterm-256color";
    };
  };
}
