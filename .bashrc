#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f "$HOME/.bash_personal" ]; then
    source $HOME/.bash_personal
fi

if [ -f "$HOME/.bash_alias" ]; then
    source $HOME/.bash_alias
fi

if [ -f "$HOME/.bash_functions" ]; then
	source $HOME/.bash_functions
fi

if [ -f "$HOME/.bash_prompt" ]; then
	source $HOME/.bash_prompt
fi
