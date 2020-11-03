# Before running this script:
# sudo chrown -R abdullah /usr/local

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Install and use latest bash
brew install bash
chsh -s /usr/local/bin/bash

# Install git
brew install git
# Some git defaults
git config --global color.ui true
git config --global push.default simple

# Install nvm
echo "Installing nvm..."
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
nvm install stable
nvm alias default stable

# Centralize global npm packages for different node versions
echo "prefix = /usr/local" > ~/.npmrc

# Install Brew Cask
echo "Installing brew cask..."
brew install caskroom/cask/brew-cask

# Apps
apps=(
  google-chrome
  firefox
  iterm2
  divvy
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Install oh my zsh!
echo "Installing oh my zsh!..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install oh my zsh! plugins
echo "Installing oh my zsh! plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

# clone this repo
git clone https://github.com/abdullahceylan/dotfiles ~/.dotfiles

# Make some commonly used folders
mkdir ~/development

# Source dot files
echo '. ~/.dotfiles/zsh/.zshrc' >> ~/.zshrc
echo '. ~/.dotfiles/.vimrc' >> ~/.vimrc
echo '. ~/.dotfiles/bash/.profile' >> ~/.profile
source ~/.profile

# make oh my zsh! as default
chsh -s $(which zsh)
