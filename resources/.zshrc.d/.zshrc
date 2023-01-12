if [ -e "${DOTFILES_DIR}/resources/.zshrc.d/user.local.sh" ] ; then
  . "${DOTFILES_DIR}/resources/.zshrc.d/user.local.sh"
fi

if [ -e "${DOTFILES_DIR}/resources/.zshrc.d/generated.local.sh" ] ; then
  . "${DOTFILES_DIR}/resources/.zshrc.d/generated.local.sh"
fi

if [ -d "${DOTFILES_DIR}/resources/.zshrc.d/functions" ] ; then
  for f in "${DOTFILES_DIR}"/resources/.zshrc.d/functions/*.sh ; do
    . "$f"
  done
fi

bindkey -v
function vi-yank-xclip {
  zle vi-yank
 echo "$CUTBUFFER" | pbcopy -i
}

zle -N vi-yank-xclip
bindkey -M vicmd 'y' vi-yank-xclip

autoload -Uz compinit && compinit

. "${DOTFILES_DIR}/resources/.zshrc.d/prompt.sh"
. "${DOTFILES_DIR}/resources/.zshrc.d/alias.sh"

aws-sso-check-login --force >/dev/null
sso-check