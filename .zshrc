#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

ZSH_THEME="pure"

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file
#
# export PYENV_ROOT="${HOME}/.pyenv"
#
# if [ -d "${PYENV_ROOT}" ]; then
#       export PATH="${PYENV_ROOT}/bin:${PATH}"
#           eval "$(pyenv init -)"
# fi
#
# export PATH
#
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
source $VIRTUALENVWRAPPER_SCRIPT
eval $(dinghy env)

setopt autonamedirs
hash -d docs=$HOME/Documents

# Docker compose
alias dkc="docker-compose"
alias dkrun="docker-compose run --rm web"
alias dkm="docker-machine"

# react-native
alias rn="react-native"
alias rnios="react-native run-ios"
alias rnlogi="react-native log-ios"
alias rnand="react-native run-android"
alias rnloga="adb logcat"

export PATH=$PATH:/Users/lab/Library/Android/sdk/platform-tools/
