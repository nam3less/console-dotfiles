autoload -U zmv

# Initialize zplug and source it
if [[ ! -a ~/.zplug ]]; then
    curl -sL --proto-redir -all,https \
        https://raw.githubusercontent.com/zplug/installer/master/installer.zsh \
        | zsh
fi


# Let zplug manage itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Declare zsh plugins to download and source
# Editing helpers
zplug "zsh-users/zsh-autosuggestions", \
    use:zsh-autosuggestions.zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "hlissner/zsh-autopair"

# Eye candy
zplug "denysdovhan/spaceship-zsh-theme", \
    use:spaceship.zsh, \
    from:github, \
    as:theme

# Luxury
zplug "ascii-soup/zsh-url-highlighter"
zplug "MichaelAquilina/zsh-you-should-use"
zplug "supercrabtree/k"

zplug load

# Spaceship prompt configuration
SPACESHIP_TIME_SHOW=true

alias k='k -A -h'
alias mmv='noglob zmv -W'


eval $(thefuck --alias)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
