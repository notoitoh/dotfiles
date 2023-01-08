echo "Install zplofile..."

if [[ $(check-os) == "linux" ]]; then
  cat << EOF > ${SCRIPT_DIR}/resources/.zplofile.d/generated.local.sh
eval "\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
EOF
fi
if [[ $(check-os) == "mac" ]]; then
  cat << EOF > ${SCRIPT_DIR}/resources/.zplofile.d/generated.local.sh
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
eval "\$(/opt/homebrew/bin/brew shellenv)"
EOF
fi

symlink-backup "${SCRIPT_DIR}/resources/.zplofile.d/.zplofile" "${HOME}/.zplofile" "${SCRIPT_DIR}/resources/.zplofile.d/user.local.sh"

source ~/.zplofile

echo "Install zplofile completed."