#!/usr/bin/env bash

# source: https://github.com/matijs/dotfiles/blob/master/osx.sh
# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

chsh -s $(which zsh)

# Install homebrew and homebrew cask
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew bundle

# Change standard shell to zshell
chsh -s $(which zsh)

mkdir ~/.nvm

# install zgen if it is not installed already
if [[ ! -d ${HOME}/.zgen ]]; then
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

# Install and use newest version of node
nvm install node
nvm use node

# Update npm itself
npm i -g npm to update

npm install -g tldr

# Install virtualenv
mkdir $HOME/.venv
sudo easy_install pip
pip install --upgrade virtualenv

# Link dotfiles
ln -Ffs ~/dotfiles/.zshenv ~/.zshenv
ln -Ffs ~/dotfiles/.zshrc ~/.zshrc
ln -Ffs ~/dotfiles/.editorconfig ~/.editorconfig
ln -Ffs ~/dotfiles/.aliasrc ~/.aliasrc
ln -Ffs ~/dotfiles/.tmux.conf ~/.tmux.conf

# Set the name of the Mac

scutil --set ComputerName "jonasmerlin-macbookpro"
scutil --set LocalHostName "jonasmerlin-macbookpro"
scutil --set HostName "jonasmerlin-macbookpro"
