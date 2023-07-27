# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="dracula"
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# LS_COLORS is used by GNU ls. LSCOLORS is used by BSD ls.
export LS_COLORS='fi=00:mi=00:mh=00:ln=01;36:or=01;31:di=01;34:ow=04;01;34:st=34:tw=04;34:'
LS_COLORS+='pi=01;33:so=01;33:do=01;33:bd=01;33:cd=01;33:su=01;35:sg=01;35:ca=01;35:ex=01;32'
export LSCOLORS='ExGxDxDxCxDxDxFxFxexEx'

# TREE_COLORS is used by GNU tree. It looks awful with underlined text, so we turn it off.
export TREE_COLORS=${LS_COLORS//04;}

# Use GNU ls colors in completion lists.
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    aws
    command-not-found
    docker
    fasd
    git
    npm
    nvm
    poetry
    python
    react-native
    sudo
    systemd
    ubuntu
    vscode
    web-search
    yarn
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export VISUAL=vim
export EDITOR="$VISUAL"

# If you come from bash you might have to change your $PATH.
# Set up Python
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
alias python="python3"
alias acpoetry='. "$(dirname $(poetry run which python))/activate"'

# Setup NVM
export NVM_DIR="/home/broadband/.nvm"
[ -s "/home/broadband/.nvm/nvm.sh" ] && \. "/home/broadband/.nvm/nvm.sh"
[ -s "/home/broadband/.nvm/bash_completion" ] && \. "/home/broadband/.nvm/bash_completion"

# ls minimal
function le(){
  ls "$@" | less
}

alias ls_default="ls --color=tty --group-directories-first"
alias ls="ls_default" # ls 1-per-line, in color, dirs first
alias la="ls -A"     # ls all (show hidden)
alias ll="ls -lAhF"  # ls long
alias lm="ls -1"
unalias lsa
unalias l
