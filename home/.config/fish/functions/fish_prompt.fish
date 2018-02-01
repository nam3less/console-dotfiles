function fish_prompt --description 'Write out the prompt'
	set -l color_cwd
    set -l suffix
    set -l mode

    switch $USER
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix 'λ'
    end

    echo -s "$USER" @ (prompt_hostname) ' ' (set_color $color_cwd) (prompt_pwd) 
    set_color green --bold
    echo -n " $suffix  "
    set_color normal
end

