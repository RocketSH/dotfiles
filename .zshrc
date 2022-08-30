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
alias gsh='git stash'
alias ga='git add'
alias gaa='git add -A'
alias gb='git branch'
alias gc='git commit'
alias gco='git checkout'
alias gd='git diff'
alias glol='git log --all --graph --decorate --oneline'
alias gp='git push'
alias gpu='git pull'
alias gicm="git init && git add -A && git commit -m 'Initial commit'"

gpd() {
  branch="$(git rev-parse --abbrev-ref HEAD)"
  git push -u origin "$branch"
}

ticket() {
  base_branch="${BASE_BRANCH:-origin/development}"
  initials="${INITIALS:-SH}"
  ticket_number="$1"
  name="${@:2}"
  task_name="$(echo $name | tr ' ' '_' | tr '[:upper:]' '[:lower:]')"
  branch_name="${initials}_${ticket_number}_${task_name}"
  echo "Creating branch $branch_name"
  git checkout -b $branch_name $base_branch
}


alias c="code ."
alias cd..="cd .."
alias gr='git restore'

alias y="yarn"
alias yd="yarn dev"
alias ys="yarn start"

alias vim=nvim
alias icotxt=iconv -f big5 -t utf8

# ruby on rails
alias b="bundle"
alias br="bin\/rails server"
alias dbm="bin\/rails db:migrate"
alias rs="bin\/rspec"
alias bw="bin\/webpack-dev-server"
alias bc="bin\/rails console --sandbox"
alias fm="foreman start -f Procfile.dev"
alias fs="foreman start"

# homebrew
alias brewall="brew update && brew upgrade && brew cleanup"

# export PATH="/usr/local/opt/ruby/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

. $HOME/.asdf/asdf.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=/opt/homebrew/bin:$PATH

export EDITOR="nvim"
