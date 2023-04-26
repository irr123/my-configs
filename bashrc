PS1=": ${debian_chroot:+($debian_chroot)}\w;\[$(tput sgr0)\] "

shopt -s no_empty_cmd_completion

export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR=vim
export GOPATH=$HOME/workspace/go-path
export HISTCONTROL=ignoredups:ignorespace
export HISTFILESIZE=500
export HISTSIZE=500
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PAGER=less
export PATH="$GOPATH/bin:$PATH"
export SCREENDIR=$HOME/.screen

alias cp='cp -v'
alias less='less -FSRXc'
alias ll='ls -FGlAhp'
alias mkdir='mkdir -v'
alias mv='mv -v'
alias rm='rm -v'

alias adminer='f() { docker run --name adminer --rm -it -p 8081:8080 -e ADMINER_DESIGN="pokorny" adminer:4.8.1-standalone };f'
alias mysql='f() { docker run --name mysql --rm -it mysql:8.0.31 ${@:-bash} };f'

[[ -e ~/.private_cfg ]] && . ~/.private_cfg
