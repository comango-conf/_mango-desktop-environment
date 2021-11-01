#!/bin/bash

export EDITOR="wsed"

export _JAVA_AWT_WM_NONREPARENTING=1

export JAVA_HOME="<#{JAVA_HOME}#>"
export PATH="$JAVA_HOME/bin:$PATH"


export PATH="~/.local/bin:$PATH"

export SPICETIFY_INSTALL="/home/hannah/.spicetify"
export PATH="$SPICETIFY_INSTALL:$PATH"

export DENO_INSTALL="/home/hannah/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"



alias grep='grep --color'
alias ls='ls --color=auto --group-directories-first'
alias tree='tree --dirsfirst -I .git'
alias open='xdg-open'
