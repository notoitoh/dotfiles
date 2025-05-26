echo "Install brew..."

if [[ $(check-os) == "linux" ]]; then
  BREW_PATH="/home/linuxbrew/.linuxbrew"
  if [[ ! $(which brew) ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(${BREW_PATH}/bin/brew shellenv)"
    sudo apt-get install build-essential
    brew install gcc
  fi
fi

if [[ $(check-os) == "mac" ]]; then
  if [[ $(uname -m) == "x86_64" ]]; then
    BREW_PATH="/usr/local"
  fi
  if [[ $(uname -m) == "arm64" ]]; then
    BREW_PATH="/opt/homebrew"
  fi
  if [[ ! $(which brew) ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    eval "$(${BREW_PATH}/bin/brew shellenv)"
  fi
  brew tap homebrew/cask-fonts
  brew install font-hackgen
  brew install visual-studio-code --cask
  brew install gnu-getopt
fi

brew install wget
brew install vim
brew install n
brew install jq
brew install zsh-completions
brew install git-remote-codecommit
brew install pict
brew install md5sha1sum
brew install tree

echo "Install brew completed."