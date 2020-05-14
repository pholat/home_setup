# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

set -x QT_SCALE_FACTOR '1.25'

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

function fish_user_key_bindings
  fish_vi_key_bindings
end

alias pacman "pacman --color=auto"
alias vim "nvim"

status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source
function fuck -d "Correct your previous console command"
  set -l fucked_up_command $history[1]
  env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv | read -l unfucked_command
  if [ "$unfucked_command" != "" ]
    eval $unfucked_command
    builtin history delete --exact --case-sensitive -- $fucked_up_command
    builtin history merge ^ /dev/null
  end
end
