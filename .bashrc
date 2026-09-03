#### Configuration du prompt ####
PS1='\[\e[38;5;114;1m\]\u\[\e[0m\]@\[\e[38;5;114;1m\]\h\[\e[0m\]:\[\e[38;5;114m\]\w\\$\[\e[0m\] '

# ~/.bashrc: exécuté par bash pour les shells non interactifs.
case $- in
    *i*) ;;
      *) return;;
esac

# Ne pas mettre les lignes en double ou commençant par un espace dans l'historique.
HISTCONTROL=ignoreboth

# Ajouter les commandes à la fin de l'historique, ne pas l'écraser
shopt -s histappend

# Pour définir la longueur de l'historique
HISTSIZE=1000
HISTFILESIZE=2000

# Vérifier la taille de la fenêtre après chaque commande
shopt -s checkwinsize

# Rendre less plus convivial pour les fichiers d'entrée non textuels
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Définir un invite de commande élégant
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# Activer les fonctionnalités de complétion automatique programmables
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#### Configuration des variables d'environnement (from Zsh config) ####
export EDITOR="vim"
export GIT_EDITOR="vim"
export VISUAL="vim"
export BROWSER="firefox"

#### Configuration des alias ####

# Alias système
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias mv='mv -i'
alias rm='rm -i'

alias q="exit"
alias v="vim"
alias vi="vim"
alias c="clear"

alias gtp="cd $HOME/projs && clear && ls -a"
alias udir="cd /share/l1istn && clear && ls -a"

alias g="git"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gpl="git pull"
alias gps="git push"
alias gcl="git clone"
alias gbd="git branch -D"
alias gbs="git switch"

# Original aliases (kept)
alias -- -daemon='Interdit'
alias bitcoind='bitcoind '
alias btc='bitcoind -regtest -printtoconsole'
alias btcshell='bitcoin-cli -regtest'
alias dockerd-rootless-setuptool.sh='/usr/local/etc/docker/set_containers_rootdir.sh && sudo /usr/local/etc/docker/set_subid.sh && dockerd-rootless-setuptool.sh install'

#### fzf configuration ####
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
