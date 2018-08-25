
# export SSH_KEY_PATH="~/.ssh/rsa_id"

export ZSH=/home/pholat/.oh-my-zsh
ZSH_THEME="gallois"
setopt extended_glob ksh_glob glob_dots

# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  colored-man-pages
  colorize
  rsync
  thefuck
  autojump
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'
# export SSH_KEY_PATH="~/.ssh/rsa_id"
alias vi="nvim"
alias vim="nvim"
set -o vi
bindkey '^R' history-incremental-pattern-search-backward
bindkey -M vicmd 'k' vi-up-line-or-history
bindkey -M vicmd 'j' vi-down-line-or-history
HISTSIZE=10000000
SAVEHIST=10000000

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
unsetopt EXTENDED_HISTORY

bindkey -v
set menu-complete-display-prefix on
set show-all-if-ambiguous on
function PRETTY () { $* 2>&1 | gawk -f ~/.prettyfier.awk; $( [[ ${PIPESTATUS[0]} -eq 0 ]] ); }
source /home/pholat/.oh-my-zsh/plugins/zaw/zaw.zsh

bindkey '^R' zaw-history
zstyle ':filter-select' case-insensitive yes
zstyle ':filter-select' max-lines 10
HISTORY_IGNORE="(ls|cd|pwd|exit|cd|mv ..)"
