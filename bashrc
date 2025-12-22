case $- in
    *i*) ;;
      *) return;;
esac

PS1=": ${debian_chroot:+($debian_chroot)}\w\[\033[0m\]; "

shopt -s no_empty_cmd_completion
stty -ixon

export BASH_SILENCE_DEPRECATION_WARNING=1
export BUILDKIT_PROGRESS=plain
export COMPOSE_BAKE=true
export EDITOR=vim
export GOPATH="$HOME/workspace/go-path"
export HISTCONTROL=ignoredups:ignorespace
export HISTFILESIZE=500
export HISTSIZE=500
export LANG=en_US.UTF-8
export LC_ALL="$LANG"
export NEXT_TELEMETRY_DISABLED=1
export PAGER="less -S" # Basic pager with line chopping
export PATH="$GOPATH/bin:$PATH"
export SCREENDIR="$HOME/.screen"

alias cp='cp -v'
alias ll='ls -FGlAhp'
alias mkdir='mkdir -v'
alias mv='mv -v'
alias rm='rm -v'
alias less='less -FSRXc'
alias docker=podman

alias adminer="docker run --name adminer --rm -it -p 8080:8080 -e ADMINER_DESIGN=pokorny adminer:standalone"
alias mysql="docker run --name mysql --rm -it mysql:lts bash"
alias jupiter="docker run --name jupyter --rm -it --user root -p 8888:8888 -v \"\$PWD\":/home/jovyan/work jupyter/datascience-notebook:ubuntu-22.04 jupyter-lab --NotebookApp.token='' --NotebookApp.password='' --allow-root"

if [[ -e ~/.private_cfg ]]; then . ~/.private_cfg; fi
if [[ -e ~/.local/bin/env ]]; then . ~/.local/bin/env; fi
