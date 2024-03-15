{ config, ... }:

{
   home.file."${config.xdg.configHome}/swappy/config" = {
      text =''
      [Default]
      save_dir=$HOME/personal/pictures/screenshots
      save_filename_format=screenshot-%d%m%Y-%H%M%S.png
      show_panel=false
      line_size=5
      text_size=20
      text_font=sans-serif
      paint_mode=brush
      early_exit=false
      fill_shape=false
      '';
   };
}
