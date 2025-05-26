echo "Install tools..."

DOTFILES_DIR="${HOME}/dotfiles"
cd "${DOTFILES_DIR}/resources/.zshrc.d/functions/tools/"

n 22
yarn install
yarn aws-sso-check-login:build

echo "Install tools completed."