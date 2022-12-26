echo "Install tools..."

DOTFILES_DIR="${HOME}/dotfiles"
cd "${DOTFILES_DIR}/resources/.bashrc.d/functions/tools/"

sudo n 16
yarn install
yarn aws-sso-check-login:build

echo "Install tools completed."