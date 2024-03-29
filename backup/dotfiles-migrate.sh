# Migrates (links) your local dotfiles to the ones in the repository
#
# 1) If you have both local and source files and local is not link, then make backup of local in order to link the one from source.
# 2) If you have unlinked local file without source file, just move the local one to source and create local link to it.
# 3) If you don't have local, nor source file, just create source file and create local link to it.
# 3) If you have source, but don't have local link to it, then just create the link
function migrate () {
    mkdir -p $(dirname "$2")

    if [[ -f "$1" && ! -L "$1" ]]; then
        if [ -f "$2" ]; then
            echo "Moving $1 to backup"
            mv "$1" "$1".$(date +%s).backup;
        else
            echo "Moving $1 to dotfiles"
            mv "$1" "$2"
        fi
    fi

    if [ ! -f "$2" ]; then
        echo "Creating $2"
        touch "$2"
    fi

    if [ ! -L "$1" ]; then
        echo "Linking $1 -> $2"
        mkdir -p $(dirname $1)
        ln -s "$2" "$1"
    fi
}

migrate_simple () {
    migrate ~/."$1" ~/dotfiles/"$1"
}

echo "Migrating dotfiles"
# List of dotfile to migrate
migrate_simple zshrc
migrate_simple zprofile
migrate_simple gitconfig
migrate ~/.ssh/config ~/dotfiles/ssh-config
migrate ~/.aws/credentials ~/dotfiles/aws-config
migrate ~/.ssh/known_hosts ~/dotfiles/ssh-known_hosts
migrate ~/"Library/Application Support/Code/User/settings.json" ~/dotfiles/vscode-settings.json