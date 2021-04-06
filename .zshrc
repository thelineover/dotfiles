# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/thelineover/.oh-my-zsh"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"

export LDFLAGS="-L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/opt/homebrew/opt/zlib/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/zlib/lib/pkgconfig"

export PATH="/opt/homebrew/opt/bzip2/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/bzip2/lib"
export CPPFLAGS="-I/opt/homebrew/opt/bzip2/include"

plugins=(git fzf fast-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# TMUX
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux attach -t Bigsur || tmux new -s Bigsur
fi

# Starship
eval "$(starship init zsh)"

# NVM
export NVM_DIR="/Users/thelineover/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# rbenv
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# Alias
alias nvimrc="v ~/.config/nvim/init.vim"
alias sz="source ~/.zshrc"
alias zshrc="vim ~/.zshrc"
alias tmuxrc="v ~/.tmux.conf"
alias vim="nvim"
alias v="nvim"
alias python="python3"

# Many mistake keys
alias cl='clear'
alias lc='clear'
alias cle='clear'
alias clea='clear'
alias claer='clear'
alias clere='clear'
alias clera='clear'
alias clare='clear'
alias dlaer='clear'
alias lcear='clear'
alias celar='clear'
alias cleawr='clear'
alias celra='clear'

alias ls='colorls'
alias lss='ls'
alias sl='ls'
alias lsd='ls'
alias sls='ls'

alias xit='exit'
source $(dirname $(gem which colorls))/tab_complete.sh
alias lc='colorls -lA --sd'
alias lca='colorls --gs -lA --sd -t'

source ~/forgit/forgit.plugin.zsh

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
