#!/usr/bin/env bash

# source: https://github.com/matijs/dotfiles/blob/master/osx.sh
# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install zshell
sudo apt install zsh

# Change standard shell to zshell
chsh -s $(which zsh)

# Install antigen plug-in manager for zshell
curl -L git.io/antigen > antigen.zsh

# Link dotfiles
ln -Ffs Documents/code/dotfiles/.zshrc .zshrc