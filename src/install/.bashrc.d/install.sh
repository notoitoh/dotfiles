echo "Install bashrc..."

bash ${SCRIPT_DIR}/src/install/shared/.bashrc.d/functions/tools/install.sh

if [ -e "~/.bashrc" ] ; then
    mv ~/.bashrc "${SCRIPT_DIR}/resources/.bashrc.d/user.local.sh"
fi

ln -s "${SCRIPT_DIR}/resources/.bashrc.d/.bashrc" ~/.bashrc

source ~/.bashrc

echo "Install bashrc completed."