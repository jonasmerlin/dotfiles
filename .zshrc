# load zgen
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    # load the oh-my-zsh's library
    zgen oh-my-zsh

    # plugins from robbyrussell's oh-my-zsh
    zgen oh-my-zsh plugins/colored-man-pages
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/extract
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/jsontools
    zgen oh-my-zsh plugins/sublime
    zgen oh-my-zsh plugins/node
    zgen oh-my-zsh plugins/npm
    zgen oh-my-zsh plugins/osx
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/z

    # other plugins
    # syntax highlighting
    zgen load zsh-users/zsh-syntax-highlighting
    # autosuggestion of historic line completion
    zgen load zsh-users/zsh-autosuggestions

    # completions
    zgen load zsh-users/zsh-completions src
    # reminds you that you should use one of your existing aliases for a command you just typed
    zgen load MichaelAquilina/zsh-you-should-use
    # please OS X (or whatever your name is) just fucking reset your DNS cache please
    zgen load eventi/noreallyjustfuckingstopalready

    # theme
    zgen oh-my-zsh themes/ys

    GIBO_AC_DIR="${ZSH}/custom/plugins/gibo"
    if [ ! -d "${GIBO_AC_DIR}" ]; then
      echo "Creating gibo dir"
      mkdir -p ${GIBO_AC_DIR}
      git clone https://github.com/simonwhitaker/gibo.git ~
      mv "~/gibo/gibo-completion.zsh" "${GIBO_AC_DIR}/gibo.plugin.zsh"
      rm -rf ~/gibo
    fi

    zgen oh-my-zsh custom/plugins/gibo

    # save all to init script
    zgen save
fi

# change time stamp format for history command
# the optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd-mm-yyyy"

# enable command auto-correction
setopt CORRECT
# if entered command doesn't exist, presume it is a directory and cd
setopt AUTO_CD

# make nvm work
export NVM_DIR="${HOME}/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# make z work
. /usr/local/etc/profile.d/z.sh

# source aliases from ~/.aliasrc
# . is the traditional source from Bourne and Korn shells
if [[ -r ${HOME}/.aliasrc ]]; then
  . ~/.aliasrc
fi
