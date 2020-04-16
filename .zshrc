autoload -Uz compinit
setopt prompt_subst
bindkey -v
compinit

# function to return current branch name while suppressing errors.
function git_branch() {
    branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
    if [[ $branch == "" ]]; then
        :
    else
        echo \($branch\)
    fi
}

export FZF_DEFAULT_COMMAND="ag -g ."
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_TMUX=1

PS1=$'%{\e[34m%}%m%{\e[m%}:%{\e[32m%}%~%{\e[m%}$ '
RPROMPT='$(git_branch)'
ENABLE_CORRECTION="true"
export EDITOR=/usr/local/bin/nvim

if [ "$(uname)" = "Linux" ]; then
  alias ls="ls --color=auto"
else;
  alias ls="ls -G"
fi

setopt auto_cd
alias ga='git add -A'
alias gs='git status'
alias gc='git commit'
alias gck='git checkout'
alias gb='git branch'
alias glol='git log --oneline'
alias gp='git push'
alias vim=nvim
# export PATH="/usr/local/opt/ruby/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

. $HOME/.asdf/asdf.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
