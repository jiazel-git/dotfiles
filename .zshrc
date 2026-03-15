# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gnzh"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Set-up icons for files/directories in terminal using lsd
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias n='nvim'
alias lg='lazygit'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

export https_proxy="http://127.0.0.1:7897" 
export http_proxy="http://127.0.0.1:7897" 
export all_proxy="socks5://127.0.0.1:7897"

#npm bin
NPM='/home/carbon/.npm-global/bin'
# pyenv root
PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$NPM:$PATH"
eval "$(pyenv init -)"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
