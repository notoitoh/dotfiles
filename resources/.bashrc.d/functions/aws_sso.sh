function singleton() {
  hash=$(echo "$*" | mdgsum | awk '{ print $1 }')
  screen -x $hash > /dev/null || ((screen -UAmdS $hash $*) && (screen -x $hash))
}

function aws-sso-check-login() {
  node $DOTFILES_DIR/resources/.bashrc.d/functions/tools/src/aws-sso-check-login/dest/aws-sso-check-login/aws-sso-check-login.js $*
}

AWS_ORG=$(which aws)

function sso-check() {
  sso_test=$($(aws-sso-check-login > /dev/null 2>&1) || echo $?)
  if [ "$sso_test" ] && [ "$sso_test" -ne 0 ]; then
    echo "Login required."
    $AWS_ORG sso login
  fi
}

function aws-with-sso() {
  sso-check
  $AWS_ORG $*
}

GIT_ORG=$(which git)
function git-with-sso() {
  origin=$($GIT_ORG config --get remote.origin.url)
  if [[ "$origin" = "codecommit::"* ]]; then
    sso-check
  fi
  $GIT_ORG $*
}

function aws() {
  aws-with-sso $*
}

function git() {
  git-with-sso $*
}
