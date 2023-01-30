# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
  # Shell is non-interactive.  Be done now!
    return
fi


# Put your fun stuff here.

source $HOME/.profile 2>/dev/null

HISTCONTROL="erasedups:ignoredups"
stty -ixon

# terminal emulator name
emulator=$(ps -ho "%c"  -p $PPID)


reset="\[\e[00m\]"
black="\[\e[30m\]"
red="\[\e[31m\]"
green="\[\e[32m\]"
yellow="\[\e[33m\]"
blue="\[\e[34m\]"
magenta="\[\e[35m\]"
cyan="\[\e[36m\]"
lgray="\[\e[37m\]"

dgray="\[\e[90m\]"
lred="\[\e[91m\]"
lgreen="\[\e[92m\]"
lyellow="\[\e[93m\]"
lblue="\[\e[94m\]"
lmagenta="\[\e[95m\]"
lcyan="\[\e[96m\]"
white="\[\e[97m\]"

bold="\[\e[1m\]"
dim="\[\e[2m\]"
underline="\[\e[4m\]"


case "$emulator" in
    *kitty*|*alacritty*)
        foreground_alt="\[`tput setaf 7`\]"
        primary="\[`tput setaf 16`\]"
        secondary="\[`tput setaf 17`\]"
        alert="\[`tput setaf 18`\]"
    ;;
    *)
        foreground_alt="\[`tput setaf 7`\]"
        primary="$lcyan"
        secondary="$lmagenta"
        alert="$lred"
    ;;
esac

function parse_git_branch {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's:* \(.*\):\[\1\]:'
}
export -f parse_git_branch


function create_prompt {
  PS1="\n"
  PS1+="$foreground_alt\W $secondary$(parse_git_branch)$bold "

  # color pompt symbol depending on user group
  case $(groups) in
      *root*)
        PS1+="$alert";;
      *wheel*|*sudo*)
            PS1+="$primary";;
      *);;
  esac

  PS1+=">>$reset "
}

export -f create_prompt
export PROMPT_COMMAND="create_prompt"

# if [[ $TERMINFO == *"kitty"* ]]; then
#    neofetch --kitty --source .face --size 330px --colors 16 15 15 16 15 15 15
# else
#     neofetch --colors 16 15 15 16 15 15 15 --ascii_colors 16 7 8 8 8 8
# fi
