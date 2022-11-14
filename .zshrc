source ~/.zplug/init.zsh

zplug "agkozak/zsh-z"
zplug chriskempson/base16-shell, from:github

zplug load
base16_google-light

alias d='diff -u'
alias g='git'
alias l='ls -a'
alias ll='ls -al'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias sbcl='rlwrap sbcl'

a() { rg "$@" }
f() { fd "$1" }

setopt PROMPT_SUBST
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
PROMPT='%B%(?..%F{red}%?%f )%F{blue}%~ %#%f%b '
RPROMPT='%B%F{red}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f%b'

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
