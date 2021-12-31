# # load zgen
# source "${HOME}/.zgen/zgen.zsh"

# # if the init scipt doesn't exist
# if ! zgen saved; then
#     echo "Creating a zgen save"

#     # load the oh-my-zsh's library
#     zgen oh-my-zsh

#     # plugins from robbyrussell's oh-my-zsh
#     zgen oh-my-zsh plugins/colored-man-pages
#     zgen oh-my-zsh plugins/extract
#     zgen oh-my-zsh plugins/git
#     zgen oh-my-zsh plugins/jsontools
#     zgen oh-my-zsh plugins/node
#     zgen oh-my-zsh plugins/npm
#     zgen oh-my-zsh plugins/osx
#     zgen oh-my-zsh plugins/sudo
#     zgen oh-my-zsh plugins/vi-mode

#     # other plugins
#     # syntax highlighting
#     zgen load zsh-users/zsh-syntax-highlighting
#     # autosuggestion of historic line completion
#     zgen load zsh-users/zsh-autosuggestions

#     # completions
#     zgen load zsh-users/zsh-completions src
#     # reminds you that you should use one of your existing aliases for a command you just typed
#     zgen load MichaelAquilina/zsh-you-should-use
#     # please OS X (or whatever your name is) just fucking reset your DNS cache please
#     zgen load eventi/noreallyjustfuckingstopalready

#     # theme
#     zgen oh-my-zsh themes/ys

#     GIBO_AC_DIR="${ZSH}/custom/plugins/gibo"
#     if [ ! -d "${GIBO_AC_DIR}" ]; then
#       echo "Creating gibo dir"
#       mkdir -p ${GIBO_AC_DIR}
#       git clone https://github.com/simonwhitaker/gibo.git ~
#       mv "~/gibo/gibo-completion.zsh" "${GIBO_AC_DIR}/gibo.plugin.zsh"
#       rm -rf ~/gibo
#     fi

#     zgen oh-my-zsh custom/plugins/gibo

#     # save all to init script
#     zgen save
# fi

# change time stamp format for history command
# the optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# # enable command auto-correction
# setopt CORRECT
# # if entered command doesn't exist, presume it is a directory and cd
# setopt AUTO_CD

# source aliases from ~/.aliasrc
# . is the traditional source from Bourne and Korn shells
if [[ -r ${HOME}/.aliasrc ]]; then
  . ~/.aliasrc
fi

# export NVM_DIR="$HOME/.nvm"
# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export PATH="/usr/local/sbin:$PATH"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
# [[ -f /Users/jonas/code/wf/strokes/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/jonas/code/wf/strokes/node_modules/tabtab/.completions/electron-forge.zsh

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# function to easily call cht.sh
# source: https://news.ycombinator.com/item?id=22117237
cheat () {
  curl "cheat.sh/$1"
}

eval "$(direnv hook zsh)"

eval "$(starship init zsh)"

export CMAKE_PREFIX_PATH=/usr/local/Cellar/qt/5.13.2/
export DYLD_LIBRARY_PATH=/Library/Frameworks/pylon.framework/Libraries:/Library/Frameworks/pylon.framework/Versions/A/Libraries:
export PATH="/usr/local/opt/qt@5/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/qt@5/lib"
export CPPFLAGS="-I/usr/local/opt/qt@5/include"
export PKG_CONFIG_PATH="/usr/local/opt/qt@5/lib/pkgconfig"

. ~/dotfiles/z/z.sh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
