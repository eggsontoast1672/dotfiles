if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

alias grep='grep --color=auto'
alias ls="$HOME/scripts/list --color=auto --group-directories-first"

export CMAKE_EXPORT_COMPILE_COMMANDS=ON
export CMAKE_GENERATOR=Ninja
export EDITOR=nvim
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export PS1='\n\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]\n\$ '

PATH+=":${HOME}/.config/emacs/bin"
PATH+=":${HOME}/.local/bin"
PATH+=":${HOME}/Option/omnisharp"
PATH+=":${HOME}/opt/neovim/bin"

if [ -f $HOME/.cargo/env ]; then
	source $HOME/.cargo/env
fi

if [ -f $HOME/.ghcup/env ]; then
	source $HOME/.ghcup/env
fi

if [ -f $HOME/.opam/opam-init/init.sh ]; then
	source $HOME/.opam/opam-init/init.sh
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# Pyenv shit
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"
