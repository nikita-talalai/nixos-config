{ config, ... }:

{
  home.file."${config.xdg.configHome}/tmuxinator/dots.yml".source = ./dots.yml;
}
