{
  programs.eza = {
    enable = true;
    enableAliases = false;
    extraOptions = ["-al" "--ignore-glob=.git" "--group-directories-first"];
  };
}
