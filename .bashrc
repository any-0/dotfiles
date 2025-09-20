# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoredups
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize
shopt -s globstar

PROMPT_COMMAND='PS1="\[\e[0;94m\]▶ [\[\e[0;97m\]\$(basename \$(dirname \"\$PWD\"))/\$(basename \"\$PWD\")\[\e[0;94m\]]\[\e[0m\]\[\e[0;33m\]\${VIRTUAL_ENV:+ (\$(basename \$VIRTUAL_ENV))}\[\e[0m\] \$ "'

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

alias ls='ls --color=auto'
alias v='nvim'
alias dc='cd'
alias c='cd'
alias :q='exit'
alias p='python'
