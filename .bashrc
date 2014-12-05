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
alias xclip='xclip -selection c'

# misc
alias grep='grep --color'

# directory listings
alias ls='ls -F --color=auto --show-control-chars'
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
    export PATH="$JAVA_HOME:$PATH"
fi

# jc
JC_BIN_DIR="$HOME/.jc/bin"
if [[ -d $JC_BIN_DIR ]]; then
    export PATH="$JC_BIN_DIR:$PATH"
fi

# Maven
M2_HOME="/usr/local/maven"
if [[ -d $M2_HOME ]]; then
    export M2_HOME="$M2_HOME"
    export M2="$M2_HOME/bin"
    export PATH="$M2:$PATH"
fi

# Ant
ANT_HOME="/usr/local/ant"
if [[ -d $ANT_HOME ]]; then
    export PATH="$ANT_HOME/bin:$PATH"
fi

# TeX
TEX_BIN_DIR="/usr/local/texlive/2014/bin/x86_64-linux"
if [[ -d $TEX_BIN_DIR ]]; then
    export PATH="$TEX_BIN_DIR:$PATH"
fi

# Android
ANDROID_SDK_DIR="$HOME/work/android/adt/sdk"
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
PYENV_HOME="$HOME/.pyenv/"
if [[ -d $PYENV_HOME ]]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
VIRTUALENVWRAPPER_SH="/usr/bin/virtualenvwrapper.sh"
if [[ -f $VIRTUALENVWRAPPER_SH ]]; then
    export VIRTUALENVWRAPPER_PYTHON="/usr/bin/python2.6"
    export WORKON_HOME=$HOME/.virtualenvs
    source $VIRTUALENVWRAPPER_SH
fi

# EditorConfig
EC_HOME="/usr/local/editorconfig"
if [[ -d $EC_HOME ]]; then
    export PATH="$EC_HOME/bin:$PATH"
fi

# ------------------------------------------------------------------------------
# create emacs env file
perl -wle \
    'do { print qq/(setenv "$_" "$ENV{$_}")/ if exists $ENV{$_} } for @ARGV' \
    PATH > ~/.emacs.d/shellenv.el
