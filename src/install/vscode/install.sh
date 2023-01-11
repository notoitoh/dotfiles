echo "Install vscode..."

if [[ $(check-os) == "linux" ]]; then
  symlink-replace "${SCRIPT_DIR}/resources/.vscode/settings.json" "${HOME}/.config/Code/User/settings.json"
fi
if [[ $(check-os) == "mac" ]]; then
  symlink-replace "${SCRIPT_DIR}/resources/.vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
fi

symlink-replace "${SCRIPT_DIR}/resources/.vscode/argv.json" "${HOME}/.vscode/argv.json"

code --install-extension "angular.ng-template"
code --install-extension "wallabyjs.quokka-vscode"
code --install-extension "vscodevim.vim"
code --install-extension "ms-vscode-remote.remote-containers"
code --install-extension "ms-azuretools.vscode-docker"
code --install-extension "hediet.vscode-drawio"
code --install-extension "usernamehw.errorlens"
code --install-extension "dbaeumer.vscode-eslint"
code --install-extension "redhat.vscode-yaml"
code --install-extension "42crunch.vscode-openapi"
code --install-extension "yzhang.markdown-all-in-one"
code --install-extension "ecmel.vscode-html-css"
code --install-extension "eamodio.gitlens"
code --install-extension "visualstudioexptteam.vscodeintellicode"
code --install-extension "mhutchie.git-graph"
code --install-extension "Shopify.theme-check-vscode"

echo "Install vscode completed."