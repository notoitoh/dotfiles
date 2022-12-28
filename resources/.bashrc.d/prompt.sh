PS1="\w \[\033[36m\]\$(__git_ps1)\[\033[00m\]\n\$ "

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