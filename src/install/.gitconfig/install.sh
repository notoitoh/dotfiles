echo "Install .gitconfig..."

symlink-move "${SCRIPT_DIR}/resources/.gitconfig" "${HOME}/.gitconfig"
git config --global credential.helper '${EMPTY}'
cp ${SCRIPT_DIR}/resources/.gitconfig ${SCRIPT_DIR}/resources/.gitconfig.tmp && envsubst < ${SCRIPT_DIR}/resources/.gitconfig.tmp > ${SCRIPT_DIR}/resources/.gitconfig && rm ${SCRIPT_DIR}/resources/.gitconfig.tmp

echo "Install .gitconfig completed."