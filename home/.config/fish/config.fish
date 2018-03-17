set -x TERMINAL urxvtc
set -x EDITOR nvim
set -x XDG_CONFIG_HOME "$HOME/.config/"

set -x PATH "$HOME/.local/bin" $PATH

source ~/.homesick/repos/homeshick/homeshick.fish

if test (uname) = 'Linux'; and test (tty) = '/dev/tty1'
    startx
end
