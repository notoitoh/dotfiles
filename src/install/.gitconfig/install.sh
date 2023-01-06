echo "Install .gitconfig..."

symlink-move "${SCRIPT_DIR}/resources/.gitconfig" "${HOME}/.gitconfig"
git config --global credential.helper ''

echo "Install .gitconfig completed."