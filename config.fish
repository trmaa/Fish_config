set -g fish_greeting ""
set -U fish_color_command '#aaa'

if not pgrep -x picom > /dev/null
    picom --config ~/.config/picom/picom.conf > /dev/null 2>&1 &
end

if not pgrep -x slstatus > /dev/null
    ~/Dwm_config/sss/slstatus > /dev/null 2>&1 &
end

wallpaper > /dev/null 2>&1 &
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear
clear

xrandr -s 1920x1080

#neofetch --disable gpu resolution de wm
fastfetch

#command gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default)/ font-size 20

#PS1='\[\e[1:32m\][Admin@admin \e[1:33m\]\w\e[32m\]] \e[1:0m\]$ '

#\n[\e[38;5;129m]┌─[[\e[0m][\e[1;33m]\u[\e[0m][\e[1;36m]@[\e[0m][\e[1;33m]Fedora[\e[0m][\e[38;5;129m]]─[[\e[0m][\e[1;34m]\w[\e[0m][\e[38;5;129m]][\e[38;5;129m]─[[\e[0m][\e[0;31m]@[\e[0m][\e[38;5;129m]][\e[0m]\n[\e[38;5;129m]└─[[\e[0m][\e[1;37m]$[\e[0m][\e[38;5;129m]]› [\e[0m]

# Custom prompt
function fish_prompt
    set complex false 

    echo

    set hourAmPM (LC_TIME=en_US.UTF-8 date +"%I:%M %p")
    set user (whoami)

    echo -n " "
    if $complex
        set_color '#aaa'
        echo -n "┌─["
    end
    set_color '#2B7'   # color for current directory
    echo -n (prompt_pwd)
    if $complex
        set_color "#aaa"
        echo -n "]"
    end
    
    # Uncomment if you want to show time
    # set_color "#f55"
    # echo -n " "$hourAmPM

    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set branch (git symbolic-ref --short HEAD)
        set numberOfFilesUncommited (git status --porcelain | wc -l)

        set_color '#ccaa15'
        echo -n " ("
        set_color '#ffdd77'
        echo -n $branch

        if test $numberOfFilesUncommited -gt 0
            echo -n " +$numberOfFilesUncommited"
        end

        set_color '#ccaa15'
        echo -n ")"
    end

    echo

    echo -n " "
    if $complex
        set_color "#aaa"
        echo -n "└─"
    end
    set_color '#fff'
    echo -n '$ '
end
