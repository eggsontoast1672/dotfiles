#    _               _
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|

alias grep='grep --color=auto'
alias ls="${HOME}/Scripts/list"

export CMAKE_EXPORT_COMPILE_COMMANDS=ON
export CMAKE_GENERATOR=Ninja
export EDITOR=nvim
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export GOPATH="${HOME}/Go"
export PS1='\[\033[01;31m\][\[\033[01;33m\]\u\[\033[01;32m\]@\[\033[01;34m\]\h\[\033[00m\] \[\033[01;35m\]\w\[\033[01;31m\]]\[\033[01;97m\]\$\[\033[00m\] '

PATH="${PATH}:${HOME}/.local/bin"

if [ -d "${HOME}/.bashrc.d" ]; then
    for script in "${HOME}/.bashrc.d/"*; do
        if [ -f "${script}" ]; then
            source "${script}"
        fi
    done
    unset script
fi

# Execute neofetch if it is installed
command -v neofetch > /dev/null 2>&1 && neofetch
