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

# less
LESSPIPE='/usr/bin/src-hilite-lesspipe.sh'
if [[ -f $LESSPIPE ]]; then
  export LESS='-R'
  export LESSOPEN="| $LESSPIPE %s"
fi

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

# gvm
GVM_HOME="$HOME/.gvm"
[[ -d $GVM_HOME ]] && source "$GVM_HOME/bin/gvm-init.sh"

# jc
JC_HOME="$HOME/.jc"
[[ -d $JC_HOME ]] && export PATH="$JC_BIN_DIR/bin:$PATH"

# Maven
M2_HOME="/usr/local/maven"
if [[ -d $M2_HOME ]]; then
    export M2_HOME="$M2_HOME"
    export M2="$M2_HOME/bin"
    export PATH="$M2:$PATH"
fi

# Ant
ANT_HOME="/usr/local/ant"
[[ -d $ANT_HOME ]] && export PATH="$ANT_HOME/bin:$PATH"

# TeX
TEX_BIN_DIR="/usr/local/texlive/2014/bin/x86_64-linux"
[[ -d $TEX_BIN_DIR ]] && export PATH="$TEX_BIN_DIR:$PATH"

# Android
ANDROID_SDK_DIR="$HOME/work/android/adt/sdk"
[[ -d $ANDROID_SDK_DIR ]] && export PATH="$ANDROID_SDK_DIR/tools:$ANDROID_SDK_DIR/platform-tools:$PATH"

# Ruby
RBENV_HOME="$HOME/.rbenv"
if [[ -d $RBENV_HOME ]]; then
    export PATH="$RBENV_BIN_DIR/bin:$PATH"
    eval "$(rbenv init -)"
fi

# Node
NVM_HOME="$HOME/.nvm"
[[ -d $NVM_HOME ]] && source "$NVM_HOME/nvm.sh"

# Python
PYENV_HOME="$HOME/.pyenv"
if [[ -d $PYENV_HOME ]]; then
    export PATH="$PYENV_HOME/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# EditorConfig
EC_HOME="/usr/local/editorconfig"
[[ -d $EC_HOME ]] && export PATH="$EC_HOME/bin:$PATH"

# ------------------------------------------------------------------------------
# create emacs env file
perl -wle \
    'do { print qq/(setenv "$_" "$ENV{$_}")/ if exists $ENV{$_} } for @ARGV' \
    PATH > ~/.emacs.d/shellenv.el
