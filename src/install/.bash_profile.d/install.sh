echo "Install bash_profile..."

if [[ $(check-os) == "linux" ]]; then
  cat << EOF > ${SCRIPT_DIR}/resources/.bash_profile.d/generated.local.sh
eval "\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
EOF
fi
if [[ $(check-os) == "mac" ]]; then
  cat << EOF > ${SCRIPT_DIR}/resources/.bash_profile.d/generated.local.sh
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
eval "\$(/opt/homebrew/bin/brew shellenv)"
EOF
fi

symlink-backup "${SCRIPT_DIR}/resources/.bash_profile.d/.bash_profile" "${HOME}/.bash_profile" "${SCRIPT_DIR}/resources/.bash_profile.d/user.local.sh"

source ~/.bash_profile

echo "Install bash_profile completed."