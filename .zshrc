# Install antigen if it is not installed already
if [[ ! -f ~/.antigen.zsh ]]; then
  curl https://raw.githubusercontent.com/zsh-users/antigen/master/antigen.zsh > ~/.antigen.zsh
fi

source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle command-not-found
antigen bundle cask
antigen bundle docker
antigen bundle extract
antigen bundle git
antigen bundle jsontools
antigen bundle sublime
antigen bundle node
antigen bundle npm
antigen bundle osx
antigen bundle sudo
antigen bundle web-search
antigen bundle yarn
antigen bundle z

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
# Autosuggestion of historic line completion.
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# Change time stamp format for history command.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd-mm-yyyy"

# Enable command auto-correction.
setopt CORRECT
# If entered command doesn't exist, presume it is a directory and cd to it.
setopt AUTO_CD

# These and more are actually already set by oh-my-zsh but I keep them around
# to remind me of them.
# Append new history to the old.
setopt APPEND_HISTORY
# Do that not just on exiting the shell but constantly.
setopt INC_APPEND_HISTORY
# Share history across system.
setopt SHARE_HISTORY
# Display time, date and completion time in history.
setopt EXTENDED_HISTORY
# Throw out duplicate lines first when history fills up.
setopt HIST_EXPIRE_DUPS_FIRST
# Lines which begin with a space don't go into the history.
setopt HIST_IGNORE_SPACE


# Make nvm work
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Make z work
. /usr/local/etc/profile.d/z.sh

# Source aliases from ~/.aliasrc
# . is the traditional source from Bourne and Korn shells.
if [[ -r ~/.aliasrc ]]; then
  . ~/.aliasrc
fi
