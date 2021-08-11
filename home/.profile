#!/bin/bash

export EDITOR="wsed"

export _JAVA_AWT_WM_NONREPARENTING=1

export JAVA_HOME="/opt/java/jdk-16.0.2+7"
export PATH="$JAVA_HOME/bin:$PATH"


export PATH="~/.local/bin:$PATH"

export SPICETIFY_INSTALL="/home/hannah/.spicetify"
export PATH="$SPICETIFY_INSTALL:$PATH"

export DENO_INSTALL="/home/hannah/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export CLASSPATH=".:/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH"



alias grep='grep --color'
alias ls='ls --color=auto --group-directories-first'
alias tree='tree --dirsfirst -I .git'
alias open='xdg-open'

alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'

