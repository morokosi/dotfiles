#
# Shell Variables
#
SAVEHIST=1000000
HISTSIZE=1000000
HISTFILE=~/.zhistory

#
# Color Settings
#
autoload -U colors
colors

source /homesc2/kisimoto/work/zsh-git-prompt/zshrc.sh
if [ $HOST = "devweb" ]; then
    export GIT_PROMPT_EXECUTABLE="haskell"
fi


#
# Prompt
#
#PROMPT='%m:%~[%h]%# '

TRI='⮀'
PROMPT="%{${fg[black]}%}%{${bg[red]}%}%n@%m%{${fg[red]}${bg[green]}%}${TRI}"\
"%{${fg[black]}%}%~%{${reset_color}${fg[green]}%}${TRI}"\
"%{${reset_color}%} "
#PROMPT="\$(git_super_status) "
PROMPT2="%B%{${fg[blue]}%}%_#%{${reset_color}%}%b "
SPROMPT="%B%{${fg[blue]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
RPROMPT="\$(git_super_status)[%h](%w/%t)"
#
# key bind
#
stty -istrip
case $OSTYPE in
    linux*)
	stty intr '^c' erase '^H' kill '^u' susp '^z'
	;;
    default)
	stty intr '^c' erase '^H' kill '^u' susp '^z' dsusp '^y'
        ;;
esac
bindkey -me 2> /dev/null

#
# Options
#
setopt ignore_eof
setopt notify
setopt auto_list
setopt nobeep
setopt auto_pushd
setopt pushd_ignore_dups

#
# Mail Settings
#
MAILPATH="/var/mail/$USER"
MAILCHECK=20

#
# Complementarity
#
autoload -U compinit
compinit -U
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#compctl -/ cd chdir dirs pushd
compctl -c man which
compctl -g '*.tex' platex jlatex
compctl -g '*.dvi' xdvi dvi2ps
compctl -g '*.ps' gv lpr idraw
#compctl -k hosts rup ping nslookup
#compctl -k limitargs limit unlimit

# for Kasahara Lab.
#compctl -g '*.f' offe
#compctl -g '*.q' _+ -g '*.bq' mmp
#compctl -g '*.bq' mmp
#compctl -g '*.mq' shield ompfbe

#
# Aliases
#
alias ls='ls -F --color=yes --show-control-chars'
#alias l='ls -lAgs | less -r'
#alias la='ls -A'
#alias ll='ls -l'
alias egdb='emacs24 -f gud-gdb'


#
# Functions
#
title () {echo -n "\e]0;$*\a"}
function cd() { builtin cd $@ && ls; }

#
# OS local specific settings
#
case $OSTYPE in
    linux*)
        ulimit -c 0
        ;;
esac

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
