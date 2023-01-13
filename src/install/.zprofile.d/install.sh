echo "Install zprofile..."

if [[ $(check-os) == "linux" ]]; then
  cat << EOF > ${SCRIPT_DIR}/resources/.zprofile.d/generated.local.sh
eval "\$(${BREW_PATH} shellenv)"
EOF
fi
if [[ $(check-os) == "mac" ]]; then
  cat << EOF > ${SCRIPT_DIR}/resources/.zprofile.d/generated.local.sh
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
eval "\$(${BREW_PATH} shellenv)"
EOF
fi

symlink-backup "${SCRIPT_DIR}/resources/.zprofile.d/.zprofile" "${HOME}/.zprofile" "${SCRIPT_DIR}/resources/.zprofile.d/user.local.sh"
symlink-replace "${SCRIPT_DIR}/resources/.zprofile.d/.zprofile" "${HOME}/.bash_plofile"

source ~/.zprofile

echo "Install zprofile completed."