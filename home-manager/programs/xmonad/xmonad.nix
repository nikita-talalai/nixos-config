{
  xsession.windowManager.xmonad = {
    enable = true;
    config = ./xmonad.hs;
  };

  programs.xmobar = { enable = true; };
}
