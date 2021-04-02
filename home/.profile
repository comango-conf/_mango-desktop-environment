#!/bin/bash

export EDITOR="wsed"

export _JAVA_AWT_WM_NONREPARENTING=1


#export GTK_THEME=Adapta:dark

export PATH="~/.local/bin:$PATH"

export SPICETIFY_INSTALL="/home/hannah/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

alias grep='grep --color'
alias ls='ls --color=auto --group-directories-first'
alias tree='tree --dirsfirst -I .git'
alias open='xdg-open'

export CLASSPATH=".:/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH"

alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'

