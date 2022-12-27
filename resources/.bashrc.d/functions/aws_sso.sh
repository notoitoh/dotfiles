function singleton() {
    hash=$(echo "$*" | mdgsum | awk '{ print $1 }')
    screen -x $hash > /dev/null || ((screen -UAmdS $hash $*) && (screen -x $hash))
}

function aws-sso-check-login() {
    node $DOTFILES_DIR/resources/.bashrc.d/functions/tools/src/aws-sso-check-login/dest/aws-sso-check-login/aws-sso-check-login.js $*
}

AWS_ORG=$(which aws)
function aws-with-sso() {
    sso_test=$($(aws-sso-check-login > /dev/null 2>&1) || echo $?)
    if [ "$sso_test" -ne 0 ]; then
        echo "Login required."
        $AWS_ORG sso login
        aws-with-sso $*
    else
        $AWS_ORG $*
    fi
}

GIT_ORG=$(which git)
function git-with-sso() {
    origin=$($GIT_ORG config --get remote.origin.url)
    if [[ "$origin" = "codecommit::"* ]]; then
        sso_test=$($(aws-sso-check-login > /dev/null 2>&1) || echo $?)
    fi
    if [[ "$origin" = "codecommit::"* ]] && [ "$sso_test" -ne 0 ]; then
        echo "Login required."
        $AWS_ORG sso login
        git-with-sso $*
    else
        $GIT_ORG $*
    fi
}

function aws() {
    aws-with-sso $*
}

function git() {
    git-with-sso $*
}

export -f singleton aws-sso-check-login aws git
