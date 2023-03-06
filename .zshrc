# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=$PATH:~/go/bin

# Path to your oh-my-zsh installation.
export ZSH="/Users/horvayf/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose kubectl)

#fix for insecure completion spam 
ZSH_DISABLE_COMPFIX=true

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#manual stuff that i added

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

source <(kubectl completion zsh)
source <(helm completion zsh)

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# some more ls aliases
alias vi='nvim'
alias ll='ls -l'
alias la='ls -A'
alias lla='ls -la'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ...'
alias cd..='cd ..'
alias gs='git status'
alias gc='git commit -s'
alias gp='git push'
alias gpl='git pull'
alias push='git push origin $1'
alias gco='git checkout'
alias checkout='git checkout $1'
alias pull='git pull $1'
alias ga='git add'
alias gl='git log'
alias s='sudo'
alias pdf='qpdfview'
alias gs='git status'
alias gl='git log'
alias gd='git diff'
alias gll='git log --graph  --oneline --all --decorate'
alias gf='git fetch'
alias gff='git flow feature'

# Docker
alias d='docker'
alias dse='docker service'
alias dst='docker stack'
alias dc='docker-compose'
alias dcdev='docker-compose -f docker-compose.yml -f docker-compose.dev.yml'
alias dm'=docker-machine'

# Kubernetes
alias k='kubectl'
alias kg='kubectl get'
alias kgp='kubectl get pod'
alias kgpa='kubectl get pod -A'
alias kgs='kubectl get service'
alias kgsa='kubectl get service -A'
alias kgd='kubectl get deploy'
alias kgda='kubectl get deploy -A'
alias kgcm='kubectl get configmap'
alias kgns='kubectl get ns'
alias kdel='kubectl delete'
alias ke='kubectl edit'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias kd='kubectl describe'
alias ka='kubectl apply'
alias kctx='kubectx'
alias kns='kubens'
alias kpf='kubectl port-forward'
alias mk='minikube'

# ansible
alias ans='ansible'
alias ansp='ansible playbook'

# terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfs='terraform state'
alias tfsl='terraform state list'
alias tfss='terraform state show'
alias tfmt='terraform fmt'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfaa='terraform apply --auto-approve'

# terragrunt
alias tg='terragrunt'

# Kill all processec which are blocking a certain TCP port
killport(){
	sudo kill -9 $(sudo fuser -n tcp $1 2> /dev/null);
}

# usage: klogs <namespace> <service/pod name> <container>
klogs() {
	pod=$(kubectl get pods -n "$1" --no-headers -o custom-columns=":metadata.name" | grep "$2")
	kubectl logs -n "$1" "$pod" "$3"
}

# usage: klogs <namespace> <service/pod name> <container>
klogsf() {
	pod=$(kubectl get pods -n "$1" --no-headers -o custom-columns=":metadata.name" | grep "$2")
	kubectl logs -f -n "$1" "$pod" "$3"
}

# usage: kportfw <namespace> <pod name (substring)> <port:port>
kportfw() {
	echo "--> forwarding $1-$2 via $3"
	pod=$(kubectl get pods -n "$1" --no-headers -o custom-columns=":metadata.name" | grep "$2")
	kubectl -n "$1" port-forward "$pod" "$3"
}

kpodwatch() {
	echo "--> watching pods of stack $1"
	watch -n 1 kubectl -n "$1" get pods
}

ksh() {
	if [ -z "$1" ]; then
		echo "--> missing namespace"
		return
	fi
	echo "--> starting interactive sh (alpine) in namespace $1"
	kubectl run -n $1 -it --rm --restart=Never alpine --image=alpine sh
}

export PATH="/usr/local/sbin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Load Angular CLI autocompletion.
source <(ng completion script)

export JAVA_HOME=$HOME/OpenJDK/jdk-18.0.2.1.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH

eval "$(zoxide init zsh)"
