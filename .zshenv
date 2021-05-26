# This file is usually run for every kind of zshell.
# "Usually" because if the NO_RCS option is set in /etc/.zshenv or 
# zshell is run with the -f option, no other startup files are run.

# Resetting things like $PATH can break things that have intentionally tweaked it. 
# One common trick is to only set variables in .zshenv if $SHLVL is 1
# http://zshwiki.org/home/config/files
if [[ $SHLVL = 1 ]]; then
    # ssh (I'm not sure if this needs to be done.)
    export SSH_KEY_PATH="~/.ssh/rsa_id"

    # Make Sublime Text the standard editor.
    # Vim for remote files.
    # editor for local and remote sessions
    if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='code'
    else
    export EDITOR='vim'
    fi
fi