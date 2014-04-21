# .bashrc

# ------------------------------------------------------------------------------
# source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# ------------------------------------------------------------------------------
# alias

# interactive operation
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# misc
alias grep='grep --color'

# directory listings
alias ls='ls -hF --color=always --show-control-chars'
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# ------------------------------------------------------------------------------
# environment

# lang
LANG=en_US.UTF-8

# history
export HISTCONTROL="ignoreboth"
export HISTFILESIZE="4096"
export HISTSIZE="4096"

# ------------------------------------------------------------------------------
# shell option

# interaction mode
if [[ "${PS1}" ]] ; then
    shopt -s cmdhist
    shopt -s histappend
    shopt -s checkwinsize
    shopt -s no_empty_cmd_completion
    shopt -u histappend
    shopt -q -s cdspell
    shopt -q -s checkwinsize
    shopt -s cmdhist
fi

# ------------------------------------------------------------------------------
# prompt
export PS1="[\u@\h \W]\$ "

# ------------------------------------------------------------------------------
# complete
complete -d cd

# ------------------------------------------------------------------------------
# path

# location

# Java
JAVA_HOME="/usr/java/default"
if [[ -d $JAVA_HOME ]]; then
    export JAVA_HOME="$JAVA_HOME"
fi

# TeX
TEX_BIN_DIR="/usr/local/texlive/2013/bin/x86_64-linux"
if [[ -d $TEX_BIN_DIR ]]; then
    export PATH="$TEX_BIN_DIR:$PATH"
fi

# Android
ANDROID_SDK_DIR="~/work/android/adt/sdk"
if [[ -d $ANDROID_SDK_DIR ]]; then
    export PATH="$ANDROID_SDK_DIR/tools:$ANDROID_SDK_DIR/platform-tools:$PATH"
fi

# Ruby
RBENV_BIN_DIR="$HOME/.rbenv/bin"
if [[ -d $RBENV_BIN_DIR ]]; then
    export PATH="$RBENV_BIN_DIR:$PATH"
    eval "$(rbenv init -)"
fi

# Node
NVM_SH="$HOME/.nvm/nvm.sh"
if [[ -f $NVM_SH ]]; then
    source $NVM_SH
fi

# Python
if [[ -f /usr/bin/virtualenvwrapper.sh ]]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/bin/virtualenvwrapper.sh
    workon default
fi

# ------------------------------------------------------------------------------
# create emacs env file
perl -wle \
    'do { print qq/(setenv "$_" "$ENV{$_}")/ if exists $ENV{$_} } for @ARGV' \
    PATH > ~/.emacs.d/shellenv.el
