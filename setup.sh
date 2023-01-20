xcode-select --install
if [[ $? -eq 0 ]]
then
    prompt_for 'Waiting for XCode installation UI. Press enter when XCode is installed.'
elif [[ $? -eq 1 ]]
then
    git --version > /dev/null
    if [[ $? -eq 0 ]]
    then
        log_info 'Xcode command line tools are already installed'
    else
        log_critical 'Unable to install xcode command line tools. See above output for additional instructions.'
   fi
fi


# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Docker
brew install --cask docker

# Install Neovim
brew install neovim --HEAD

# Install NVM
brew install nvm

# Install Python
brew install "python@3.9"

# Install RipGrep
brew install ripgrep

# Use Default Node Version
nvm alias default 18.13.0

# Install Global Node Packages
npm install -g eslint typescript

# Install Neovim Config
mkdir -p $XDG_CONFIG_HOME/src
git clone git@github.com:clearhunch/init.lua.git $XDG_CONFIG_HOME/src

