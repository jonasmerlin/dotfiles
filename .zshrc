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
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply


# source z
. /usr/local/etc/profile.d/z.sh

# Enable command auto-correction.
# ENABLE_CORRECTION="true"
setopt correct

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"


# Change time stamp format for history command.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd-mm-yyyy"

# Make Sublime Text the standard editor.
# Vim for remote files.
# editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='subl'
else
  export EDITOR='vim'
fi

# ssh (I'm not sure if this needs to be done.)
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Alises
# oh-my-zsh users are encouraged to define aliases within the ZSH_CUSTOM folder.
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias mkdir="mkdir -p"
alias ll="ls -al"