#!/usr/bin/env bash

# source: https://github.com/matijs/dotfiles/blob/master/osx.sh
# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install homebrew and homebrew cask
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew bundle

# Add zsh to the list of allowed shells to make chsh work
echo /usr/local/bin/zsh | sudo tee -a /etc/shells

# Change standard shell to zshell
chsh -s $(which zsh)

# TODO: Test this.
# Should make nvm work already
export NVM_DIR="${HOME}/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

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

# # Use the Solarized Dark theme by default in Terminal.app
# # Source: https://github.com/kevinSuttle/macOS-Defaults
# osascript <<EOD

# tell application "Terminal"

# 	local allOpenedWindows
# 	local initialOpenedWindows
# 	local windowID
# 	set themeName to "Ocean"

# 	(* Store the IDs of all the open terminal windows. *)
# 	set initialOpenedWindows to id of every window

# 	(* Wait a little bit to ensure that the custom theme is added. *)
# 	delay 1

# 	(* Set the custom theme as the default terminal theme. *)
# 	set default settings to settings set themeName

# 	(* Get the IDs of all the currently opened terminal windows. *)
# 	set allOpenedWindows to id of every window

# 	repeat with windowID in allOpenedWindows

# 		(* Close the additional windows that were opened in order
# 		   to add the custom theme to the list of terminal themes. *)
# 		if initialOpenedWindows does not contain windowID then
# 			close (every window whose id is windowID)

# 		(* Change the theme for the initial opened terminal windows
# 		   to remove the need to close them in order for the custom
# 		   theme to be applied. *)
# 		else
# 			set current settings of tabs of (every window whose id is windowID) to settings set themeName
# 		end if

# 	end repeat

# end tell

# EOD

# Install virtualenv
mkdir $HOME/.venv
sudo easy_install pip
pip install --upgrade virtualenv

# Link dotfiles
ln -Ffs ~/dotfiles/.zshenv .zshenv
ln -Ffs ~/dotfiles/.zshrc .zshrc
ln -Ffs ~/dotfiles/.editorconfig .editorconfig

# Set the name of the Mac

scutil --set ComputerName "jonasmerlin-macbookpro"
scutil --set LocalHostName "jonasmerlin-macbookpro"
scutil --set HostName "jonasmerlin-macbookpro"
