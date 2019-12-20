# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where YADR is installed.
yadr=$HOME/.yadr

prog=$HOME/programming
proj=$HOME/Projects
internal=~proj/tsi-internal-libraries
infra=~proj/tsi-infrastructure
sites=~proj/tsi-sites
foss=~proj/thelab-foss
ecom=~sites/tsi-ecom-core
common=~ecom/tsi-common/src/tsicommon
cmreact=~ecom/tsi-common-react
tempur=~sites/tsi-tempurpedic
cocoon=~sites/tsi-cocoon
sale=~sites/tsi-sale
pillows=~sites/tsi-pillows
toppers=~sites/tsi-toppers
sealy=~sites/tsi-sealy
sync=~sites/tsi-sync
stearns=~sites/tsi-stearns
cloud=~sites/tsi-diamond
reviews=~sites/tsi-reviews-api
locator=~sites/tsi-retail-locator



alias aliases='vim $HOME/.yadr/zsh/aliases.zsh'

alias gcurrent_branch='git rev-parse --abbrev-ref HEAD'
alias gpushfix='git push --set-upstream origin $(gcurrent_branch)'

function gopen() {
  # echo "$1";
  if [ "$#" -eq 1 ]; then
    git open origin $(gcurrent_branch)/"$1"
  elif [ "$#" -eq 2 ]; then
    git open origin $(gcurrent_branch)/"$1""\x23""L""$2"
  fi
}

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# YADR support
alias yav='yadr vim-add-plugin'
alias ydv='yadr vim-delete-plugin'
alias ylv='yadr vim-list-plugin'
alias yup='yadr update-plugins'
alias yip='yadr init-plugins'

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
TRAPHUP() {
  source $yadr/zsh/aliases.zsh
}

alias ae='vim $yadr/zsh/aliases.zsh' #alias edit
alias ar='source $yadr/zsh/aliases.zsh'  #alias reload
alias gar="killall -HUP -u \"$USER\" zsh"  #global alias reload

# vim using
mvim --version > /dev/null 2>&1
MACVIM_INSTALLED=$?
if [ $MACVIM_INSTALLED -eq 0 ]; then
  alias vim="mvim -v"
fi

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'

# Git Aliases
alias gs='git status'
alias gstsh='git stash'
alias gst='git stash'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias gap='git add -p'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gfa='git fetch --all'
alias gfap='git fetch --all --prune'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
alias gbd='git b -D -w'
# Staged and cached are the same thing
alias gdc='git diff --cached -w'
alias gds='git diff --staged -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gdmb='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Zippin
alias gz='tar -zcvf'

# Ruby
alias c='rails c' # Rails 3
alias co='script/console' # Rails 2
alias cod='script/console --debugger'

#If you want your thin to listen on a port for local VM development
#export VM_IP=10.0.0.1 <-- your vm ip
alias ts='thin start -a ${VM_IP:-127.0.0.1}'
alias ms='mongrel_rails start'
alias tfdl='tail -f log/development.log'
alias tftl='tail -f log/test.log'

alias ka9='killall -9'
alias k9='kill -9'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'

# TODOS
# This uses NValt (NotationalVelocity alt fork) - http://brettterpstra.com/project/nvalt/
# to find the note called 'todo'
alias todo='open nvalt://find/todo'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# Zeus
alias zs='zeus server'
alias zc='zeus console'
alias zr='zeus rspec'
alias zrc='zeus rails c'
alias zrs='zeus rails s'
alias zrdbm='zeus rake db:migrate'
alias zrdbtp='zeus rake db:test:prepare'

# Rspec
alias rs='rspec spec'
alias sr='spring rspec'
alias src='spring rails c'
alias srgm='spring rails g migration'
alias srdm='spring rake db:migrate'
alias srdt='spring rake db:migrate'
alias srdmt='spring rake db:migrate db:test:prepare'


# Sprintly - https://github.com/nextbigsoundinc/Sprintly-GitHub
alias sp='sprintly'
# spb = sprintly branch - create a branch automatically based on the bug you're working on
alias spb="git checkout -b \`sp | tail -2 | grep '#' | sed 's/^ //' | sed 's/[^A-Za-z0-9 ]//g' | sed 's/ /-/g' | cut -d"-" -f1,2,3,4,5\`"

alias hpr='hub pull-request'
alias grb='git recent-branches'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias dbtp='spring rake db:test:prepare'
alias dbm='spring rake db:migrate'
alias dbmr='spring rake db:migrate:redo'
alias dbmd='spring rake db:migrate:down'
alias dbmu='spring rake db:migrate:up'

# # Homebrew
# alias brewu='brew update  && brew upgrade && brew cleanup && brew prune && brew doctor'

# Docker Compose
alias dkc=docker-compose
alias dkm=docker-machine
alias dkrun="dkc run --rm web"

# Project Docker
alias dcd=bin/dcd
alias dcrun="bin/dcd run --rm web"
alias dcmanage="bin/dcd run --rm web ./manage.py"
alias dcshell="bin/dcd run --rm web ./manage.py shell"

# docker clean
alias dkclean_vols='docker volume rm $(docker volume ls -qf dangling=true)'
alias dkclean_containers='docker rm $(docker ps -q -f status=exited)'
alias dkclean_images='docker images --quiet --filter=dangling=true | xargs docker rmi -f'
alias dkclean='dkclean_vols && dkclean_containers && dkclean_images'

# pingme
alias pingme="osascript -e 'display notification \"Shell process finished\" with title \"PING ME\"' && say 'all done'"

# slack cli
alias lunchtime='ssh -t labmac zsh -ic "lunchtime"'
alias worktime='ssh -t labmac zsh -ic "worktime"'
alias donetime='ssh -t labmac zsh -ic "donetime"'
alias deploytime='ssh -t labmac zsh -ic "deploytime"'

# PyPI Package Publishing
alias pypi-version='python3 setup.py --version'
alias pypi-push-public='python3 setup.py sdist bdist_wheel upload --sign'
alias pypi-push-internal='python3 setup.py sdist bdist_wheel upload -r tsi-internal --sign'

alias vaws="aws-vault exec ${AWS_DEFAULT_PROFILE:-tsi} -- aws"

alias chrome="google-chrome"

# lab ec2 workstation
export DOCKER_HOST=tcp://nharsch.builds.tsiaws.com:2376
export DOCKER_TLS_VERIFY=1

export UNISONLOCALHOSTNAME="MYLOCALSYSTEM"

export PATH="/home/nigel/.local/bin:/home/nigel/.npm-global/bin:$PATH"

alias tickets='chrome "https://thelabnyc.plan.io/issues?assigned_to_id=me"'
