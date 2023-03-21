
if [ ! $(which brew) ]; then
    echo "Installing Homebrew package manager - https://brew.sh/ "
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
else
    echo "Upgrading brew dependencies"
    brew update
    brew upgrade
fi

echo "Installing applications"

INSTALLED=$(brew list)

function brew_if_not_installed () {
    package=$1
    if [[ ! $INSTALLED = *"$package"* ]]; then
        brew install $package
    fi
}

INSTALLED_CASK=$(brew list --cask)

function brew_cask_if_not_installed () {
    package=$1
    if [[ ! $INSTALLED_CASK = *"$package"* ]]; then
        brew install --cask $package
    fi
}

#########################
# Brew formulaes
#########################

brew_if_not_installed jq
brew_if_not_installed nvm
brew_if_not_installed git
brew_if_not_installed yarn
brew_if_not_installed p7zip
brew_if_not_installed redis
brew_if_not_installed minio
brew_if_not_installed dockutil
brew_if_not_installed mongoose
brew_if_not_installed postgresql
brew_if_not_installed ruby-build
brew_if_not_installed spotify-tui
brew_if_not_installed speedtest-cli
brew_if_not_installed the_silver_searcher

brew tap mongodb/brew
brew_if_not_installed mongodb-community

#########################
# Apps to install on mac
#########################

##### Browsers
# brew_cask_if_not_installed google-chrome
# brew_cask_if_not_installed firefox

##### Storage
# brew_cask_if_not_installed onedrive
# brew_cask_if_not_installed google-drive

##### Communication
# brew_cask_if_not_installed zoom
# brew_cask_if_not_installed slack
# brew_cask_if_not_installed tandem
# brew_cask_if_not_installed discord

##### Tooling
# brew_cask_if_not_installed raycast
# brew_cask_if_not_installed clickup
# brew_cask_if_not_installed overflow
# brew_cask_if_not_installed cheatsheet
# brew_cask_if_not_installed webtorrent
# brew_cask_if_not_installed toggl-track
# brew_cask_if_not_installed microsoft-office
# brew_cask_if_not_installed balsamiq-wireframes
# brew_cask_if_not_installed keeper-password-manager

##### Dev tooling
# brew_cask_if_not_installed iterm2
# brew_cask_if_not_installed docker
# brew_cask_if_not_installed postman
# brew_cask_if_not_installed visual-studio-code
# brew_cask_if_not_installed microsoft-remote-desktop

##### DB tooling
# brew_cask_if_not_installed medis
# brew_cask_if_not_installed postico
# brew_cask_if_not_installed pgadmin4
# brew_cask_if_not_installed sequel-pro
# brew_cask_if_not_installed mongodb-compass

##### Music
# brew_cask_if_not_installed vlc
# brew_cask_if_not_installed reaper
# brew_cask_if_not_installed spotify
