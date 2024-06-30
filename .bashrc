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

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='[\[\e[38;5;34m\]\u\[\e[0m\]@\[\e[38;5;28m\]\H\[\e[0m\]]<\[\e[91m\]\w\[\e[0m\]@\[\e[38;5;160m\]${PS1_CMD1}\[\e[0m\]>\n\\$ '
PS2='> '

alias :q='exit'

# Put your fun stuff here.
