# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

##############################
# Lines added by compinstall #
##############################
zstyle :compinstall filename '/home/flpflan/.zshrc'
autoload -Uz compinit
compinit

###########################
# Zinit's installer chunk #
###########################
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

################################
# Global envirenment for shell #
################################
export GOPROXY="https://goproxy.io,direct"

export PATH="$PATH:$HOME/.cargo/bin:$HOME/snippets"

export EDITOR="nvim"
export VISUAL="nvim"

##############
# My configs #
##############
HISTFILE=~/.cache/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
bindkey -v

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit ice depth=1; zinit light romkatv/powerlevel10k
if [[ $TERM == "linux" ]]; then
    [[ ! -f ~/.p10k.tty.zsh ]] || source ~/.p10k.tty.zsh
  else
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi
zinit load ellie/atuin
zinit load MichaelAquilina/zsh-you-should-use

zstyle ':completion:*' menu select
eval "$(zoxide init zsh)"
autoload -U compinit && compinit -u


alias rgrep=$(which grep); alias grep='rg'
alias rcat=$(which cat); alias cat='bat'
alias rdf=$(which df); alias df='duf'
alias rdu=$(which du); alias du='ncdu'
alias rls=$(which ls); alias ls='eza'
alias rcd=$(which cd); alias cd='z'

alias lsgit='eza -l --git'
alias sudo='sudo -E'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

function launch_hyprland {
    exec Hyprland
}

function ya() {
    tmp="$(mktemp -t "yazi-cwd.XXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
