{ pkgs, ... }:

pkgs.tmuxPlugins.mkTmuxPlugin {
  pluginName = "extrakto";
  version = "2024.20";
  src = pkgs.fetchFromGitHub {
    owner = "laktak";
    repo = "extrakto";
    rev = "a50d3821372422a315e7ddd91c40bd0037e7c83f";
    sha256 = "sha256-XEL3OlI+j88sf4sEhG6xGPZ1sIXSWG55gr7+cNs8N4k=";
  };
  nativeBuildInputs = [ pkgs.makeWrapper ];
  postInstall = ''
      wrapProgram $target/extrakto_plugin.py \
        --prefix PATH : ${with pkgs; lib.makeBinPath (
            [ pkgs.fzf pkgs.python3 pkgs.xclip ]
            )}
    '';
}
