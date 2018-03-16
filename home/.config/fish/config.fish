set -x EDITOR nvim

set -x http_proxy "http://192.168.1.254:8080"
set -x https_proxy $http_proxy
set -x HTTP_PROXY $http_proxy
set -x HTTPS_PROXY $http_proxy
set -x no_proxy "*.local, 192.168.1.0/24, 162.168.10.0/24, hase29.app, localhost, 127.0.0.1, 169.254/16"

set -x PATH "$HOME/.composer/vendor/bin" "$HOME/.rvm/bin" "$HOME/.cargo/bin" $PATH

source ~/.homesick/repos/homeshick/homeshick.fish
source /usr/local/opt/fzf/shell/key-bindings.fish

