# Disable greeting
set -g fish_greeting ""

# Command color
set -U fish_color_command '#aaa'

# Startup commands
picom --config ~/.config/picom/picom.conf &
~/commands/walpaper.sh
~/commands/volume.sh
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
clear
clear
clear
clear
clear
clear
clear
clear
#neofetch
#command gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default)/ font-size 20

#PS1='\[\e[1:32m\][Admin@admin \e[1:33m\]\w\e[32m\]] \e[1:0m\]$ '

#\n[\e[38;5;129m]┌─[[\e[0m][\e[1;33m]\u[\e[0m][\e[1;36m]@[\e[0m][\e[1;33m]Fedora[\e[0m][\e[38;5;129m]]─[[\e[0m][\e[1;34m]\w[\e[0m][\e[38;5;129m]][\e[38;5;129m]─[[\e[0m][\e[0;31m]@[\e[0m][\e[38;5;129m]][\e[0m]\n[\e[38;5;129m]└─[[\e[0m][\e[1;37m]$[\e[0m][\e[38;5;129m]]› [\e[0m]

# Custom prompt
function fish_prompt
    echo

    set hourAmPM (LC_TIME=en_US.UTF-8 date +"%I:%M %p")

    echo -n " "
    set_color '#aaa'
    echo -n "┌─"
    
    set_color "#aaa"
    echo -n "["
    
    # Get the full hostname (FQDN used for SSH)
    set computerName (hostname -f)
    set_color '#ffaacc'
    echo -n "pablo"
    set_color '#ff77aa'
    echo -n "@"$computerName":"
    
    set_color '#2B7'
    echo -n ""(prompt_pwd)
    set_color "#aaa"
    echo -n "]"
    
    set_color "#f77"
    echo -n " "$hourAmPM
    
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
    set_color '#aaa'
    echo -n '└─'
    set_color '#fff'
    echo -n '$ '
end
