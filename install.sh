#!/bin/bash

printf "password: "
read -s password
echo "$password" | sudo -S echo "OK"

echo "Install dotfiles..."

SCRIPT_DIR=$(cd $(dirname $0); pwd)
DOTFILES_DIR_EXPECT="${HOME}/dotfiles"

function check-os() {
    unameOut="$(uname -s)"
    case "${unameOut}" in
        Linux*)     machine=linux;;
        Darwin*)    machine=mac;;
        CYGWIN*)    machine=cygwin;;
        MINGW*)     machine=mingw;;
        *)          machine="UNKNOWN:${unameOut}"
    esac
    echo ${machine}
}

# Check phase
cd $SCRIPT_DIR
if [[ "${DOTFILES_DIR}" ]]; then
    echo "This dotfiles seems to be installed already."
    exit 1
fi

if [[ "${DOTFILES_DIR_EXPECT}" != "${SCRIPT_DIR}" ]]; then
    echo "Directory incorrect."
    echo "You need to place this dotfiles directory on ${DOTFILES_DIR_EXPECT}"
    exit 1
fi

if [[ $(check-os) != "mac" && $(check-os) != "linux" ]]; then
    echo "This OS is not supported."
    exit 1
fi

echo "Install for $(check-os)"

. ${SCRIPT_DIR}/src/install/.bash_profile.d/install.sh
. ${SCRIPT_DIR}/src/install/.bashrc.d/install.sh
. ${SCRIPT_DIR}/src/install/brew/install.sh
. ${SCRIPT_DIR}/src/install/vscode/install.sh
. ${SCRIPT_DIR}/src/install/awscli/install.sh

. ${SCRIPT_DIR}/organization_options.sh
. ${SCRIPT_DIR}/personal_options.sh

echo "Install dotfiles completed."