function zle-line-init zle-keymap-select {
    VIM_NORMAL="%K{208}%F{black}■%k%f%K{208}%F{white} % NORMAL %k%f%K{black}%F{208}■%k%f"
    VIM_INSERT="%K{075}%F{black}■%k%f%K{075}%F{white} % INSERT %k%f%K{black}%F{075}■%k%f"
    VIMPROMPT="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
    PROMPT="${VIMPROMPT}
%K{blue}%F{white} %F{white}%~ %k%F{white} $%f "
    zle reset-prompt
}

setopt prompt_subst

PROMPT="%K{blue}%F{white} %F{white}%~ %k%F{white} $%f "
zle -N zle-line-init
zle -N zle-keymap-select

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
RPROMPT=\$vcs_info_msg_0_

precmd(){ vcs_info }