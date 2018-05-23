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

# Change standard shell to zshell
chsh -s $(which zsh)

# install zgen if it is not installed already
if [[ ! -d ${HOME}/.zgen ]]; then
  git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"
fi

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

# Link dotfiles
ln -Ffs .zshenv ~/dotfiles/.zshenv
ln -Ffs .zshrc ~/dotfiles/.zshrc 
ln -Ffs .editorconfig ~/dotfiles/.editorconfig
