autoload -Uz compinit
setopt prompt_subst
bindkey -v
compinit

# function to return current branch name while suppressing errors.
function git_branch() {
  #branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk '{print $NF}')
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

# git command
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias glol='git log --all --graph --decorate --oneline'
alias gp='git push'
alias gpu='git pull'

alias c="code ."
alias cd..="cd .."

alias y="yarn"
alias yd="yarn dev"
alias ys="yarn start"
alias fs="foreman start"
alias 3fs="PORT=3000 foreman start"

alias vim=nvim
alias icotxt=iconv -f big5 -t utf8
alias rmpostmaster.pid='/usr/local/var/postgres/postmaster.pid'

# ruby on rails
alias b="bundle"
alias br="bin/rails"
alias rs="rspec"
alias wds="bin/webpack-dev-server"
alias cs="bin/rails console --sandbox"
# export PATH="/usr/local/opt/ruby/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

. $HOME/.asdf/asdf.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH

export EDITOR="nvim"
