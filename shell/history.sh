#!/bin/bash

export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE="$HOME/.bash_eternal_history"
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
shopt -s checkwinsize
