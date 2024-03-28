{pkgs, ...}: let
  screenshot = pkgs.writeShellScriptBin "screenshot" ''
    #Inspired by Stephan Raabe (https://gitlab.com/stephan-raabe/dotfiles/-/blob/main/hypr/scripts/screenshot.sh?ref_type=heads)

    option1="Select area"
    option2="Fullscreen"
    options="$option1\n$option2"

    choice=$(echo -e "$options" | rofi -dmenu -replace -i -no-show-icons -l 2 -width 30 -p "Take Screenshot")

    case $choice in
        $option1)
            ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.swappy}/bin/swappy -f -
            dunstify "Screenshot created" "Mode: Area"
        ;;
        $option2)
            sleep 3
            ${pkgs.grim} - | ${pkgs.swappy} -f -
            dunstify "Screenshot created" "Mode: Fullscreen"
        ;;
    esac
  '';
in {home.packages = [screenshot];}
