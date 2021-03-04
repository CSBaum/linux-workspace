# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/sstallbaum/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bullet-train"

DEFAULT_USER=`whoami`

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

ZSH_COLORIZE_STYLE="colorful"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugns/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions 
  #osx
  gradle
  brew
  docker
  #java
  jenv
  python
  frontend-search
  nvm
  node
  dnote
  vagrant
  #rvm
  colored-man-pages
  minikube
  packer
  aws
  colorize
  vscode
  autojump
  chucknorris
  golang
  #globalias
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='ls -laG'
alias ks='ls -laG'
alias cls='clear'
alias jv='jenv version'

# Directory aliases
alias repos='cd ~/repos'
alias co='cd ~/repos/consoleorchestrator'
alias co2='cd ~/repos/co2'
alias cor='cd ~/repos/consoleorchestrator-rest'
alias jarvis='cd ~/repos/jarvis'
alias util='cd ~/repos/common-util'
alias scm='cd ~/repos/common-scm'
alias vm='cd ~/repos/common-vm'
alias tpm='cd ~/repos/passman'
alias tpmCommon='cd ~/repos/passman-common'
alias tpmCentrify='cd ~/repos/passman-centrify'
alias tpmCA='cd ~/repos/passman-cyberark'

alias listUploads='python3 ~/repos/liquidfiles/liquidfiles.py listlinks'
alias upload='python3 ~/repos/liquidfiles/liquidfiles.py link -cs 1048576 -dr -ea 30'
alias authUpload='python3 ~/repos/liquidfiles/liquidfiles.py link -cs 1048577 -dr -ea 30 -ra'

# Customized Git commands
alias gitPrune='git fetch --all --prune'
alias gs='git status'
alias gcob='git checkout -b'

alias buildco='cls;./buildLaunchDocker.sh -v ~/docker_volumes/console_orchestrator -p -n coNetwork'
alias buildcoOffline='cls;./buildLaunchDocker.sh -v ~/docker_volumes/console_orchestrator -p -n coNetwork -o'
alias killco='docker stop CO;docker rm CO; docker rmi -f com/tripwire/consoleorchestrator docker-sandbox-local.docker.scm.tripwire.com/com/tripwire/consoleorchestrator;echo "Docker containers";docker ps -a; echo ""; echo "Docker Images"; docker images'

# Docker commands
alias dockerNone='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'

# Show / Hide hidden file in Finder, etc
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# Python
alias py='python3'
alias p3='/usr/local/bin/python3'

#JEnv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
#eval "$(rbenv init -)"

# Local installations
export PATH="$HOME/installations/scripts:$HOME/installations/consul:$PATH"

# NodeVersionManager
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

#
# Set of docker aliases
#
if [[ -a ~/.docker_aliases ]]; then
  . ~/.docker_aliases
fi
export PATH=$PATH:/usr/local/opt/go/libexec/bin:/Users/sstallbaum/go/bin:/Users/sstallbaum/installations/vault:/Users/sstallbaum/Applications/ethminer/bin

prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

#
# set iTerm tab title
#
#precmd() {
  # sets the tab title to current dir
  #echo -ne "\e]1;${PWD##*/}\a"
#}

#
#  Kubernetes / KIND bits
#
export KUBECONFIG=”$(kind get kubeconfig-path)”

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PATH="/usr/local/opt/sqlite/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/sstallbaum/installations/consul/consul consul

#
# Retrieving keys from keyring
#
source ~/keychain-environment-variables.sh

# AWS configuration example, after doing:
# $  set-keychain-environment-variable AWS_ACCESS_KEY_ID
#       provide: "AKIAYOURACCESSKEY"
# $  set-keychain-environment-variable AWS_SECRET_ACCESS_KEY
#       provide: "j1/yoursupersecret/password"

#
# Binutil specific aliases as neede
#
alias readelf='/usr/local/opt/binutils/bin/readelf'
#
# Vagrant / VSphere
#
export VSPHERE_USER='tss\sstallbaum'
export VSPHERE_PASSWORD=$(keychain-environment-variable VSPHERE_PASSWORD);

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
alias lzd='lazydocker'

complete -o nospace -C /Users/sstallbaum/installations/vault/vault vault

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# PyEnv Setup
#
#export PYENV_ROOT=”$HOME/.pyenv”
#export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export WORKON_HOME=~/.virtualenvs

mkdir -p $WORKON_HOME
. ~/.pyenv/versions/3.8.3/bin/virtualenvwrapper.sh
export PATH="/usr/local/sbin:$PATH"

#
# Perlbrew setup
#
source ~/perl5/perlbrew/etc/bashrc

#
# K8 related bits
#
alias m='minikube'
