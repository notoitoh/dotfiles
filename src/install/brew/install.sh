echo "Install brew..."

if [[ $(check-os) == "linux" ]]; then
  BREW_PATH="/home/linuxbrew/.linuxbrew/bin/brew"
  if [[ ! $(which brew) ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(${BREW_PATH} shellenv)"
    sudo apt-get install build-essential
    brew install gcc
  fi
fi

if [[ $(check-os) == "mac" ]]; then
  if [[ $(uname -m) == "x86_64" ]]; then
    BREW_PATH="/usr/local/bin/brew"
  fi
  if [[ $(uname -m) == "arm64" ]]; then
    BREW_PATH="/opt/homebrew/bin/brew"
  fi
  if [[ ! $(which brew) ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    eval "$(${BREW_PATH} shellenv)"
  fi
  brew tap homebrew/cask-fonts
  brew install font-hackgen
  brew install visual-studio-code --cask
fi

brew install wget
brew install vim
brew install n
brew install jq
brew install yarn
brew install zsh-completions
brew install git-remote-codecommit
brew install pict
brew install md5sha1sum
brew install tree

echo "Install brew completed."