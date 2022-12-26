echo "Install brew..."
if [[ $(check-os) == "linux" ]]; then
    if [[ ! $(which brew) ]]; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/nohtoit/.profile
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
        sudo apt-get install build-essential zsh
        brew install gcc
    fi

    brew install vim
    brew install n
    brew install yarn
fi

if [[ $(check-os) == "mac" ]]; then
    if [[ ! $(which brew) ]]; then
        xcode-select --install
    fi

    brew tap homebrew/cask-fonts
    brew install font-hackgen
    brew install visual-studio-code --cask
    brew install vim
    brew install n
    brew install yarn
fi
echo "Install brew completed."