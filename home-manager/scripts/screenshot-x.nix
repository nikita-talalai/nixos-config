{pkgs, ...}: let
  screenshot-x = pkgs.writeShellScriptBin "screenshot-x" ''
    #Inspired by Stephan Raabe (https://gitlab.com/stephan-raabe/dotfiles/-/blob/main/hypr/scripts/screenshot.sh?ref_type=heads)

    option1="Select area"
    option2="Focused window"
    option3="Left monitor"
    option4="Right monitor"
    option5="Both monitors"
    options="$option1\n$option2\n$option3\n$option4\n$option5"

    choice=$(echo -e "$options" | rofi -dmenu -replace -i -no-show-icons -l 5 -width 30 -p "Take Screenshot")

    case $choice in
        $option1)
            ${pkgs.scrot}/bin/scrot '%d-%m-%Y_$wx$h_$W' -d b3 -s -f
            dunstify "Screenshot created" "Mode: Area"
        ;;
        $option2)
            ${pkgs.scrot}/bin/scrot '%d-%m-%Y_$wx$h_$W' -d 3 -u
            dunstify "Screenshot created" "Mode: Focused window"
        ;;
        $option3)
            ${pkgs.scrot}/bin/scrot '%d-%m-%Y_$wx$h_$W' -d 3 -M 0
            dunstify "Screenshot created" "Mode: Left monitor"
        ;;
        $option4)
            ${pkgs.scrot}/bin/scrot '%d-%m-%Y_$wx$h_$W' -d 3 -M 1
            dunstify "Screenshot created" "Mode: Right monitor"
        ;;
        $option5)
            ${pkgs.scrot}/bin/scrot '%d-%m-%Y_$wx$h_$W' -d 3
            dunstify "Screenshot created" "Mode: Both monitors"
        ;;
    esac
  '';
in {home.packages = [screenshot-x];}
