echo "Install zprofile..."

if [[ $(check-os) == "linux" ]]; then
  cat << EOF > ${SCRIPT_DIR}/resources/.zprofile.d/generated.local.sh
eval "\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
EOF
fi
if [[ $(check-os) == "mac" ]]; then
  cat << EOF > ${SCRIPT_DIR}/resources/.zprofile.d/generated.local.sh
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
eval "\$(/opt/homebrew/bin/brew shellenv)"
EOF
fi

symlink-backup "${SCRIPT_DIR}/resources/.zprofile.d/.zprofile" "${HOME}/.zprofile" "${SCRIPT_DIR}/resources/.zprofile.d/user.local.sh"

source ~/.zprofile

echo "Install zprofile completed."