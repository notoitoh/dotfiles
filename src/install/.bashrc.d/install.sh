echo "Install bashrc..."

bash ${SCRIPT_DIR}/src/install/.bashrc.d/functions/tools/install.sh

if [ ! -d "${SCRIPT_DIR}/resources/.bashrc.d/thirdparty" ] ; then
    mkdir "${SCRIPT_DIR}/resources/.bashrc.d/thirdparty"
else
    rm -rf "${SCRIPT_DIR}/resources/.bashrc.d/thirdparty"
fi
wget -P "${SCRIPT_DIR}/resources/.bashrc.d/thirdparty" https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
wget -P "${SCRIPT_DIR}/resources/.bashrc.d/thirdparty" https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh


if [ -e "~/.bashrc" ] ; then
    mv ~/.bashrc "${SCRIPT_DIR}/resources/.bashrc.d/user.local.sh"
fi

ln -s "${SCRIPT_DIR}/resources/.bashrc.d/.bashrc" ~/.bashrc

source ~/.bashrc

echo "Install bashrc completed."