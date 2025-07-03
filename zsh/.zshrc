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
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"

export EDITOR="nvim"
export VISUAL="neovide"

##############
# My configs #
##############

#]===============[ Local envirenment variable ]===============[#

HISTFILE=$XDG_CACHE_HOME/zsh/history
HISTSIZE=1000
SAVEHIST=1000
ZSH_AUTOSUGGEST_STRATEGY=(completion history)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=59'
ZVM_VI_INSERT_ESCAPE_BINDKEY=jj

#]========================[ Key bind ]========================[#

bindkey -v # <C-V>: Paste
if [[ -o interactive ]]; then # activate only in interactive shell
    zle -N yy && bindkey '^T' yy # <C-T>: Call yy
    zle -N _exit_wrap && bindkey '^Q' _exit_wrap # <C-Q>: Call exit
fi

#]=======================[ Completion ]=======================[#

# zstyle ':completion:*' menu yes select search
# zstyle ':completion::complete:*' cache-path ${XDG_CACHE_HOME}/zsh/zcompcache
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' fzf-flags  $(awk -F ' ' '{print $1}' <<< ${FZF_DEFAULT_OPTS}) --no-scrollbar --no-hscroll --prompt ' ' --pointer '' --marker ''
zstyle ':fzf-tab:*' popup-min-size 80 12
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons=always --color=always --group-directories-first -a -1 $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza --icons=always --color=always --group-directories-first -a -1 $realpath'
# zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
zstyle :compinstall filename '$HOME/.zshrc'

# autoload -Uz compinit 
# _comp_files=($XDG_CACHE_HOME/zsh/zcompcache(Nm-20))
# if (( $#_comp_files )); then
#     compinit -u -i -C -d "$XDG_CACHE_HOME/zsh/zcompcache"
# else
#     compinit -u -i -d "$XDG_CACHE_HOME/zsh/zcompcache"
# fi
# unset _comp_files
autoload -Uz compinit && compinit -u -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

#]========================[ Theme ]===========================[#

if [[ $TERM == "linux" ]]; then
    zinit ice depth=1; zinit light romkatv/powerlevel10k
    [[ ! -f $XDG_CONFIG_HOME/zshrc.d/p10k-tty.zsh ]] || source $XDG_CONFIG_HOME/zshrc.d/p10k-tty.zsh
else
    eval "$(starship init zsh)"
fi
# zinit ice depth=1; zinit light romkatv/powerlevel10k
# if [[ $TERM == "xterm-kitty" ]]; then
#     [[ ! -f ~/.p10k-kitty.zsh ]] || source ~/.p10k-kitty.zsh
# elif [[ $TERM == "xterm-256color" ]]; then
#     [[ ! -f ~/.p10k-term.zsh ]] || source ~/.p10k-term.zsh
# elif [[ $TERM == "linux" ]]; then
#     [[ ! -f ~/.p10k-tty.zsh ]] || source ~/.p10k-tty.zsh
# else
#     [[ ! -f ~/.p10k-tty.zsh ]] || source ~/.p10k-tty.zsh
# fi
if [[ $HOST == "fl-pc" ]]; then
    if [[ -f $XDG_CONFIG_HOME/zshrc.d/dots-hyprland.zsh ]]; then
        source $XDG_CONFIG_HOME/zshrc.d/dots-hyprland.zsh
    fi
fi

#]========================[ Plugins ]=========================[#

zinit light Aloxaf/fzf-tab
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit ice wait"2" as"command" from"gh-r" lucid \
  mv"zoxide*/zoxide -> zoxide" \
  atclone"./zoxide init zsh --cmd cd > init.zsh" \
  atpull"%atclone" src"init.zsh" nocompile'!'
zinit ice atload "eval $(zoxide init zsh --cmd cd)"
zinit light ajeetdsouza/zoxide
zinit light ellie/atuin
# zinit ice lucid wait"0a" from"gh-r" as"program" atload'eval "$(mcfly init zsh)"'
# zinit light cantino/mcfly
zinit light MichaelAquilina/zsh-you-should-use
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
zinit light ziglang/shell-completions

zinit snippet OMZ::lib/completion.zsh

#]=========================[ Alias ]===========================[#

alias rgrep=$(which grep); alias grep='rg'
alias rfind=$(which find); alias find='fd'
alias rnvim$(which vim); alias vim='nvim'
alias rcat=$(which cat); alias cat='bat'
alias rdf=$(which df);   alias df='duf'
alias rdu=$(which du); alias du='ncdu'
alias rls=$(which ls); alias ls='eza'

alias lsgit='eza -l --git'
alias sudo='sudo -E'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
alias tc='toggle_clash'
alias tb='toggle_bcmode'

#]=======================[ Functions ]=========================[#

function yy() {
    local parent="$(ps -o comm= -p $(ps -o ppid= -p $$))"
    if [[ $parent == "yazi" ]]; then
        exit
    fi
    local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
function _exit_wrap() {
    exit
}

#] ======================[ Polish ]============================[#
[[ -f /etc/NIXOS ]] && . "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh"
[[ -f /etc/NIXOS ]] && . $XDG_CONFIG_HOME/zshrc.d/command-not-found.sh
