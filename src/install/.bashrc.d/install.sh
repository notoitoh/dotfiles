echo "Install bashrc..."

bash ${SCRIPT_DIR}/src/install/.bashrc.d/functions/tools/install.sh

symlink-backup "${SCRIPT_DIR}/resources/.bashrc.d/.bashrc" "${HOME}/.bashrc" "${SCRIPT_DIR}/resources/.bashrc.d/user.local.sh"

source "${HOME}/.bashrc"

echo "Install bashrc completed."