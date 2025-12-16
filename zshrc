DISABLE_AUTO_TITLE="true"
PROMPT=': %~%(?.%(!.#.;).%F{6}%B;%b%f) '

setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt interactivecomments

unsetopt share_history

autoload -Uz compinit && compinit -i
autoload -U +X bashcompinit && bashcompinit

export BUILDKIT_PROGRESS=plain
export EDITOR=vim
export GOPATH=$HOME/workspace/go
export HISTCONTROL=ignoredups:ignorespace
export HISTFILESIZE=500
export HISTSIZE=500
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PAGER="less -S"
export PATH="$GOPATH/bin:$PATH"
export SCREENDIR=$HOME/.screen

alias cp='cp -v'
alias less='less -FSRXc'
alias ll='ls -FGlAhp'
alias mkdir='mkdir -v'
alias mv='mv -v'
alias rm='rm -v'

alias adminer='f() { docker run --name adminer -p 8080:8080 --rm -it -e ADMINER_DESIGN="pokorny" adminer:standalone };f'
alias mysql='f() { docker run --name mysql --rm -it mysql:8.0.31 ${@:-bash} };f'

bindkey -e

bindkey "\e[1;3C" forward-word
bindkey "\e[1;3D" backward-word
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

[[ -e ~/.private_cfg ]] && source ~/.private_cfg
