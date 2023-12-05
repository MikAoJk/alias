# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# My Aliases
alias changejdk='sudo update-alternatives --config java'
alias cdgit='cd /home/joakim/git'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias listProgramms='apt list --installed' 
alias removeProgramms='sudo apt remove'
alias gitolainen='git pull --rebase && ./gradlew build && git push'
alias mountonedrive='rclone --vfs-cache-mode writes mount "onedrive":  ~/onedrive'
alias changeNode18='nvm use 18.14.2'
alias changeNode19='nvm use 19.7.0'

# kubectl
#Finn alle poder:
alias kubectlgetpods='kubectl get pods'
#Se hvilke miljø du kjører mot
alias kubectlgetcontext='kubectl config current-context'
#Se på en pods log kubectl logs <podname>
alias kubectlgetlogsforpod='kubectl logs'
#ta ned pod (kubernetes vil fyre opp en ny pod hvis antall poder er mindre enn minimum konfigurert).
alias kubectldeletePod='kubectl delete pod'
#slette hele applikasjonen fra clusteret, ingen nye poder vil bli startet før en evt. deployer app på nytt.
alias kubectldeleApplication='kubectl delete application'
#Beskriv poden
alias kubectldescribepod='kubectl describe pods'
#Endre cluster
alias kubectlchangecontext='kubectl config use-context'
#Endre namespace
alias kubectlchangenamespaceteamsykmelding='kubectl config set-context --current --namespace=teamsykmelding'

alias kubectlCreateSecret='kubectl create secret generic my-secret --from-literal=key1=supersecret'
alias kubectlGetSecret='kubectl get secret db-user-pass -o jsonpath="'"{.data.password}"'" | base64 --decode'
alias kubectlExecShell='kubectl exec --stdin --tty smtss-6dc66d6cf9-92fwh -- /bin/bash'
alias kubectldeletePodsContainerStatusUnknown='kubectl get pods | grep ContainerStatusUnknown | awk '{print $1}' | xargs kubectl delete pod -o name'

# apt
alias holdkubectl='sudo apt-mark hold kubectl'

# docker
# Shows all docker images
alias dockerimages='docker image ls'
# Delets the docker image
alias dockerdelte='docker rmi'
# Start docker compose
alias dockercompouseup='docker-compose up'
# Start docker compose and build
alias dockercompouseupbuild='docker-compose up --build'
#Lists only running Docker containers.
alias dockercontainersshow='docker ps'
#Kill my running Docker container
alias dockerkill='docker kill'
#List all conatinaers 
alias dockercontainershowall='docker container ls -all'
#Stop conatinaer
alias dockercontainerstop='docker container stop'
#Remove conatinaer
alias dockercontainerremove='docker container rm'
#find ip adress of container
alias dockercontainerfindip='docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}''

# vault
alias vaultgethelsespleisdbsecrets='vault read postgresql/preprod-fss/creds/spleis-readonly'
alias vaultgethelsespesialistdbsecrets='vault read postgresql/preprod-fss/creds/spesialist-readonly'
alias vaultlogin='sudo vault login -method=oidc'

#GCP
alias gcplogin='gcloud auth login --update-adc'
alias gcpsetdev='gcloud config set project $yourprojectid'
alias gcpsetprod='gcloud config set project $yourprojectid'
## Add inn the appname, example spesialist
alias gcppostgressqlproxy='nais postgres proxy'

#SDK man
alias javalist='sdk list java'
alias javainstall21='sdk install java 21-tem'
alias javaversion='sdk current java'
alias javause17='sdk use java 17.0.9-tem'
alias javause21='sdk use java 21-tem'

#ASDF
. "$HOME/.asdf/asdf.sh"

# My exports
export ORG_GRADLE_PROJECT_githubUser='MikAoJk'
export ORG_GRADLE_PROJECT_githubPassword='$thisiswhere is should put my secret'
export NPM_AUTH_TOKEN='$thisiswhere is should put my secret'

export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export DENO_INSTALL="/home/joakim/.deno"
export PATH="$DENO_INSTALL/bin:$HOME/.cargo/env:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

export KUBELOGIN='$HOME/.asdf/downloads/kubelogin/0.0.32/kubelogin'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
