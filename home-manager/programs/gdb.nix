{ config, ... }:

{
  home.file."${config.xdg.configHome}/gdb/gdbinit" = {
    enable = true;
    text = ''
    set disassembly-flavor intel
    '';
  };
}
