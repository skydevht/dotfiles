source ~/.zplug/init.zsh

zplug "agkozak/zsh-z"

zplug load
# base16_google-light

alias d='diff -u'
alias g='git'
alias l='ls -a'
alias ll='ls -al'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# GIT
alias gst='git status'
alias gco='git checkout --ours'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gl='git pull'
alias gp='git push'
alias gra='git remote add'

# YARN
alias y='yarn'
alias yin='yarn install'
alias yst='yarn start'
alias yt='yarn test'

alias sbcl='rlwrap sbcl'

a() {
  rg "$@"
}
f() {
  fd "$1";
}

setopt PROMPT_SUBST
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
PROMPT='%B%(?..%F{red}%?%f )%F{blue}%~ %#%f%b '
RPROMPT='%B%F{red}$(git rev-parse --abbrev-ref HEAD 2> /dev/null)%f%b'

