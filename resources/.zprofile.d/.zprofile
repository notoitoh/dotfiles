export DOTFILES_DIR="${HOME}/dotfiles"

export EDITOR=vim

export N_PREFIX=$HOME/.n
export PATH=$N_PREFIX/bin:$PATH

if [ -e "${DOTFILES_DIR}/resources/.zplofile.d/user.local.sh" ] ; then
  . "${DOTFILES_DIR}/resources/.zplofile.d/user.local.sh"
fi

if [ -e "${DOTFILES_DIR}/resources/.zplofile.d/generated.local.sh" ] ; then
  . "${DOTFILES_DIR}/resources/.zplofile.d/generated.local.sh"
fi