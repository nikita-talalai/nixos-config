{config, ...}: {
  home.file."${config.xdg.configHome}/kmonad/config.kbd" = {
    source = ./kmonad-config.kbd;
  };
}
