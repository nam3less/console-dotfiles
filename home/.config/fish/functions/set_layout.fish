function set_layout -d "Set KB layout and change capslock"
    echo $argv
    setxkbmap -layout $argv -option caps:escape
end

