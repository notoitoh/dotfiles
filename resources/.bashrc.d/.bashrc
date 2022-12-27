if [ -e "${DOTFILES_DIR}/resources/.bashrc.d/user.local.sh" ] ; then
    . "${DOTFILES_DIR}/resources/.bashrc.d/user.local.sh"
fi

if [ -e "${DOTFILES_DIR}/resources/.bashrc.d/generated.local.sh" ] ; then
    . "${DOTFILES_DIR}/resources/.bashrc.d/generated.local.sh"
fi

if [ -d "${DOTFILES_DIR}/resources/.bashrc.d/functions" ] ; then
    for f in "${DOTFILES_DIR}"/resources/.bashrc.d/functions/*.sh ; do
        . "$f"
    done
fi


PS1="\[\033[1;32m\]\$(date +%Y/%m/%d_%H:%M:%S)\[\033[0m\] \[\033[33m\]\H:\w\n\[\033[0m\][\u@ \W]\[\033[36m\]\$(__git_ps1)\[\033[00m\]\$ "

#
# git-completion.bash / git-prompt.sh
#
if [ -f "${DOTFILES_DIR}/resources/.bashrc.d/thirdparty/git-completion.bash" ]; then
    source "${DOTFILES_DIR}/resources/.bashrc.d/thirdparty/git-completion.bash"
fi
if [ -f "${DOTFILES_DIR}/resources/.bashrc.d/thirdparty/git-prompt.sh" ]; then
    source "${DOTFILES_DIR}/resources/.bashrc.d/thirdparty/git-prompt.sh"
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '
set -o vi