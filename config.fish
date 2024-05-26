set -g fish_greeting ""
set -U fish_color_command '#aaa'

function fish_prompt
    set_color '#11cc33'
    echo -n '[Admin@admin'
    set_color '#15aacc' 
    echo -n ' '(pwd)
    set_color '#11cc33'
    echo -n ']'

    # Verificar si estamos dentro de un repositorio de Git
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1
        set_color '#ccaa15'
        echo -n '('(git symbolic-ref --short HEAD)''

        # Verificar si hay cambios en el repositorio
        if git status --porcelain | grep -q '^[MADRCU]'; 
            echo -n ' +'
        else
            echo -n ''
        end

        echo -n ') '
    end

    set_color '#fff'
    echo -n '$ '
end
