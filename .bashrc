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
alias y='wl-copy'
alias gp='gopass show -c'

    

function gp() {
    gopass show -c "$@"
}

function gpu() {
    local out
    out="$(gopass show "$@")" || return 1
    printf '%s\n' "$out" | grep '^user:' | cut -d' ' -f2- | wl-copy
}

if [ -f /usr/share/bash-completion/completions/gopass ]; then
    source /usr/share/bash-completion/completions/gopass
fi

complete -o default -F _gopass_bash_autocomplete gp

__gopass_show_complete() {
    COMP_WORDS=( gopass show "${COMP_WORDS[@]:1}" )
    COMP_CWORD=$((COMP_CWORD+1))
    _gopass_bash_autocomplete
}
complete -o default -F __gopass_show_complete gpu
