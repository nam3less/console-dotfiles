function fish_title
    if [ $_ = 'fish' ]
        set cmd $_
    else
        set cmd $argv[1]
    end
    echo (prompt_pwd) " - " $cmd
end

