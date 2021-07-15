# If you come from bash you might have to change your $PATH.
    # export PATH=$HOME/bin:/usr/local/bin:$PATH

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/hash/.oh-my-zsh"
        
ZSH_THEME="robbyrussell"

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

plugins=(zsh-nvm git yarn z ag pod)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH=~/.composer/vendor/bin:$PATH
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/Projects/flutter/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"
alias config='/usr/bin/git --git-dir=/Users/hash/.cfg/ --work-tree=/Users/hash'
# eval "$(rbenv init -)" disabling rbenv for now

# Brew
export HOMEBREW_NO_AUTO_UPDATE=1

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export GOPATH=$HOME/projects/gocode
export PATH="$PATH":"$GOPATH/bin"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
