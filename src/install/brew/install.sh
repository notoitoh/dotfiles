echo "Install brew..."

if [[ $(check-os) == "linux" ]]; then
  if [[ ! $(which brew) ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    sudo apt-get install build-essential
    brew install gcc
  fi
fi

if [[ $(check-os) == "mac" ]]; then
  if [[ ! $(which brew) ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
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

echo "Install brew completed."