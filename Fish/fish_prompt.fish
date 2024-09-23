# Tema: avit inspirado en el tema avit de Oh My Posh

function _git_branch_name
    echo (command git symbolic-ref HEAD 2> /dev/null | sed -e 's|^refs/heads/||')
end

function _git_is_dirty
    echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function _git_ahead_count
    echo (command git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')
end

function _git_behind_count
    echo (command git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')
end

function fish_prompt
    set -l last_status $status
    set -l white (set_color white)
    set -l red (set_color -o red)
    set -l normal (set_color normal)
    set -l branch_color (set_color '#B5B50D')
    
    # Usando la secuencia de escape \u para los caracteres Unicode
    set -l lightning_bolt (set_color '#C2C206')""(set_color normal)
    set -l prompt_char (set_color '#007ACC')""(set_color normal)

    set -l cwd $white(pwd)

    # Output the prompt, left to right

    # Add a newline before new prompts
    echo -e ''

    # Display full current directory path
    echo -n $cwd$normal

    # Show git branch and dirty state
    if [ (_git_branch_name) ]
        set -l git_branch (_git_branch_name)

        if [ (_git_is_dirty) ]
            set git_info $branch_color$git_branch"*"$normal
        else
            set git_info $branch_color$git_branch$normal
        end

        # Show ahead/behind counts
        set -l ahead_count (_git_ahead_count)
        set -l behind_count (_git_behind_count)

        if test $ahead_count -ne 0; or test $behind_count -ne 0
            echo -n " $normal("

            if test $ahead_count -ne 0
                echo -n "$branch_color↑$ahead_count$normal"
            end

            if test $behind_count -ne 0
                echo -n "$red↓$behind_count$normal"
            end

            echo -n "$normal)"
        end

        echo -n " $normal$lightning_bolt $git_info"
    end

    # Add a space
    echo -n ' '

    # Show exit status of previous command
    if test $last_status -ne 0
        echo -n $red'✘ '
    end

    # Terminal title
    printf '\033]0;%s\007' (pwd)

    # Terminate with a nice prompt char
    echo -e ''
    echo -n $prompt_char' '
end
