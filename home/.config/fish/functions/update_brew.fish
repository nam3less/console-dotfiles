function update_brew -d "Updates the programms installed through brew and brew cask"
    echo "Updating brew registry"
    brew update

    echo "---------------------------------------------"
    echo "Checking for outdated programms"
    brew outdated
    echo "---------------------------------------------"
    brew upgrade

    echo "---------------------------------------------"
    echo "Checking for outdated programms in cask"
    brew cask outdated
    echo "---------------------------------------------"
    brew cask upgrade
end

