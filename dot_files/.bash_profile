if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ]; then
    . `brew --prefix`/etc/bash_completion.d/git-completion.bash
fi
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

TEAL="0;36m" #YOU CAN CHANGE ME
GREEN="0;38;5;47m" #YOU CAN CHANGE ME
PURPLE="0;38;5;105m" #YOU CAN CHANGE ME

export PS1='\[\e[$GREEN\]\W\[\e[$PURPLE\]$(parse_git_branch)\[\e[0;0m\] $ '

# pyenv
eval "$(pyenv init -)"

# pyenv-virtualenv:
eval "$(pyenv virtualenv-init -)"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
pyenvVirtualenvUpdatePrompt() {
    ORANGE='\[\e[0;38;5;215m\]' #YOU CAN CHANGE ME
    PINK='\[\e[0;38;5;210m\]' #YOU CAN CHANGE ME
    BLUE='\[\e[0;34m\]' #YOU CAN CHANGE ME 
    RESET='\[\e[0m\]' 
    [ -z "$PYENV_VIRTUALENV_ORIGINAL_PS1" ] && export PYENV_VIRTUALENV_ORIGINAL_PS1="$PS1"
    [ -z "$PYENV_VIRTUALENV_GLOBAL_NAME" ] && export PYENV_VIRTUALENV_GLOBAL_NAME="$(pyenv global)"
    VENV_NAME="$(pyenv version-name)"
    VENV_NAME="${VENV_NAME##*/}"
    GLOBAL_NAME="$PYENV_VIRTUALENV_GLOBAL_NAME"

    # non-global versions:
    COLOR="$BLUE"
    # global version:
    [ "$VENV_NAME" == "$GLOBAL_NAME" ] && COLOR="$ORANGE"
    # virtual envs:
    [ "${VIRTUAL_ENV##*/}" == "$VENV_NAME" ] && COLOR="$PINK"

    if [ -z "$COLOR" ]; then
        PS1="$PYENV_VIRTUALENV_ORIGINAL_PS1"
    else
        PS1="$COLOR${VENV_NAME}$RESET $PYENV_VIRTUALENV_ORIGINAL_PS1"
    fi
    export PS1
}
export PROMPT_COMMAND="$PROMPT_COMMAND pyenvVirtualenvUpdatePrompt;"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

if [ -f ~/.profile ]; then
    . ~/.profile
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

