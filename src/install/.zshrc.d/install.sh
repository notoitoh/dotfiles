echo "Install zshrc..."

bash ${SCRIPT_DIR}/src/install/.zshrc.d/functions/tools/install.sh

symlink-backup "${SCRIPT_DIR}/resources/.zshrc.d/.zshrc" "${HOME}/.zshrc" "${SCRIPT_DIR}/resources/.zshrc.d/user.local.sh"

source "${HOME}/.zshrc"

echo "Install zshrc completed."