autoload -Uz compinit
compinit

PS1=$'%{\e[34m%}%m%{\e[m%}:%{\e[32m%}%~%{\e[m%}$ '
RPROMPT='%(0?,,%?)'
ENABLE_CORRECTION="true"

if [ "$(uname)" = "Linux" ]; then
  alias ls="ls --color=auto"
else;
  alias ls="ls -G"
fi

setopt auto_cd
alias ga='git add -A'
alias gs='git status'
alias gc='git commit'
alias gf='git checkout'
# export PATH="/usr/local/opt/ruby/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
