set -x EDITOR nvim
set -x XDG_CONFIG_HOME "$HOME/.config/"

set -x PATH "$HOME/.local/bin" $PATH

source ~/.homesick/repos/homeshick/homeshick.fish

if test (uname) = 'Linux'; and test (tty) = '/dev/tty1'
    set -x TERMINAL urxvtc

    setxkbmap -layout en_US -option caps:escape

    startx
end

if test (uname) = 'Darwin'
    set -x http_proxy "http://192.168.1.254:8080"
    set -x https_proxy $http_proxy
    set -x HTTP_PROXY $http_proxy
    set -x HTTPS_PROXY $http_proxy
    set -x no_proxy "*.local, 192.168.1.0/24, 162.168.10.0/24, hase29.app, localhost, 127.0.0.1, 169.254/16"

    set -x PATH "$HOME/.composer/vendor/bin" "$HOME/.rvm/bin" "$HOME/.cargo/bin" $PATH
    source /usr/local/opt/fzf/shell/key-bindings.fish
end
