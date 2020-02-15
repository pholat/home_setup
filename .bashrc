# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
set -o vi
set -o pipefail
set colored-completion-prefix
set colored-stats
set completion-map-case
set mark-directories
# set show-mode-in-prompt
export EDITOR=vim
alias tmux="tmux -2"
GLOBIGNORE=".:.."


# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth:erasedups
HISTSIZE=-1
HISTFILESIZE=-1

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s histappend
shopt -s globstar
shopt -s cdspell
shopt -s dotglob
shopt -s extglob
shopt -s lithist

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

unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias BING='echo -ne '\'007'' 
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias :e='vim'
alias f='fuck'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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


# store colors
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[01;33m\]"
BLUE="\[\033[00;34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[00;32m\]"
RED="\[\033[0;31m\]"
VIOLET='\[\033[01;35m\]'
BLACK="\[\033[30;02m\]"

function color_my_prompt {
  local __time='\[\033[03m\[\033[34;01m\t\033[00;32m'
  local __cur_location="$BLUE \w"           # capital 'W': current directory, small 'w': full file path
  local __git_branch_color="$RED"
  local __user_input_color="$BLACK"
  local __git_branch=$(__git_ps1);

  # Build the PS1 (Prompt String)
  PS1="$__time$__cur_location$__git_branch_color$__git_branch $__user_input_color [🐍$(pyenv version-name)]\n▶ "
}

export PROMPT_COMMAND="history -a; color_my_prompt"

# if .git-prompt.sh exists, set options and execute it
if [ -f ~/.git-prompt.sh ]; then
  GIT_PS1_SHOWDIRTYSTATE=true
  #GIT_PS1_SHOWSTASHSTATE=false
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_SHOWUPSTREAM="auto"
  GIT_PS1_HIDE_IF_PWD_IGNORED=true
  GIT_PS1_SHOWCOLORHINTS=true
  . ~/.git-prompt.sh
fi

shopt -s cdspell
shopt -s cmdhist

alias LOG='tee log`date +"%F-%H-%M-%S"`.txt'

function PRETTY { $* 2>&1 | awk -f ~/.prettyfier.awk; test ${PIPESTATUS[0]} -eq 0; }
export -f PRETTY

function SIGN_CHECK { openssl asn1parse -inform DER -in "$1"; }
export -f SIGN_CHECK

function CLEAN_HISTORY { sort -u < cat .bash_history | sed -f .bashhistclean > tmp.hist && vim tmp.hist; }
export -f CLEAN_HISTORY

function B64 { sha1sum "$1" | xxd -r -p | base64; }
export -f B64

function DBG { bash -evx $@; }
export DBG

function vimdiff { nvim -d $@; }
export vimdiff

alias py="python3"
alias :q='exit'
alias :e='nvim'
alias vim='nvim'
alias vi='nvim'

alias got='git '
alias get='git '
alias cdr='tmpvar=$( ls -d */ -tr | tail -1) && cd "$tmpvar"'

function mail { ( eval $(gpg --decrypt ~/.mail_passwd); imapfilter -vv &&  mutt $@ ) }
setxkbmap -option caps:swapescape

export HSTR_CONFIG=hicolor,prompt-bottom,help-on-opposite-side
bind '"\C-r": "\e^ihstr -- \n"'
function MOD { [[ $1 ]] && local DIR="./$1/" || local DIR="./" ; printf "${DIR}%s\n" <<< echo $(cd ${DIR}; git st -s | grep '\([\?M]\)' | cut -d ' ' -f 3); }
export MOD

export PATH="$PATH:$HOME/workspace/flutter/bin:$HOME/esp/xtensa-esp32-elf/bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

alias icat='kitty +kitten icat'
alias please="sudo"
alias pd='pushd'
eval "$(pyenv init -)"
source $(pyenv root)/completions/pyenv.bash
