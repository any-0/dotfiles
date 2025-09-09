#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias v='nvim'
alias dc='cd'
alias :q='exit'
alias :qa='exit'
alias :qa='exit'
alias p='python'


if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi


PROMPT_COMMAND='PS1="\[\e[0;94m\]▶ [\[\e[0;97m\]\$(basename \$(dirname \"\$PWD\"))/\$(basename \"\$PWD\")\[\e[0;94m\]]\[\e[0m\]\[\e[0;33m\]\${VIRTUAL_ENV:+ (\$(basename \$VIRTUAL_ENV))}\[\e[0m\] \$ "'

# Created by `pipx` on 2025-07-26 15:36:47
export PATH="$PATH:/home/julian/.local/bin"


#install zoxide
eval "$(zoxide init bash)"


#zoxide cd
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash --cmd cd)"
fi

#zoxide zz
function zz() {
    z "$(zoxide query -l | fzf)"
}
