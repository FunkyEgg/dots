if [[ $- != *i* ]] ; then
	return
fi

# ssh shit
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/funkyegg
clear

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='[\[\e[38;5;34m\]\u\[\e[0m\]@\[\e[38;5;28m\]\H\[\e[0m\]]<\[\e[91m\]\w\[\e[0m\]@\[\e[38;5;160m\]${PS1_CMD1}\[\e[0m\]>\n\\$ '
PS2='> '

alias :q='exit'

export PATH="$PATH:/home/funky/.local/bin"
