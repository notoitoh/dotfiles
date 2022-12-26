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