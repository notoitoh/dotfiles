echo "Install awscli..."

if [[ ! -e "/usr/local/bin/aws" ]]; then
    mkdir temp
    cd temp

    if [[ $(check-os) == "linux" ]]; then
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        unzip awscliv2.zip
        echo "$password" | sudo -S ./aws/install
    fi

    if [[ $(check-os) == "mac" ]]; then
        curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
        echo "$password" | sudo -S installer -pkg AWSCLIV2.pkg -target /
    fi

    cd ..
    rm -rf temp

    if [[ ! -e "~/.aws" ]]; then
        mkdir ~/.aws
    fi
    ln -s "${SCRIPT_DIR}/resources/.aws/config" ~/.aws/config
fi

echo "Install awscli completed."