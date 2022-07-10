#!/bin/bash

export EDITOR="wsed"

export _JAVA_AWT_WM_NONREPARENTING=1

export JAVA_HOME="<#{JAVA_HOME}#>"
export PATH="$JAVA_HOME/bin:$PATH"


export PATH="~/.local/bin:$PATH"

export LUA_PATH=";;$HOME/.local/share/lua/?.lua;$HOME/.local/share/lua/?/init.lua"

export SPICETIFY_INSTALL="/home/hannah/.spicetify"
export PATH="$SPICETIFY_INSTALL:$PATH"

export DENO_INSTALL="/home/hannah/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export PATH=~/.npm-packages/bin:$PATH
export NODE_PATH=~/.npm-packages/lib/node_modules

export PATH=~/.local/share/flutter/bin:$PATH

alias grep='grep --color'
alias ls='ls --color=auto --group-directories-first'
alias tree='tree --dirsfirst -I .git'
alias open='xdg-open'
