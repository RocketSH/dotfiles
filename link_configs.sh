#!/bin/bash

if [[ ! -f $HOME/.config/nvim/init.vim ]]; then
  mkdir -p $HOME/.config/nvim
  ln -s $HOME/.dotfiles/init.vim $HOME/.config/nvim/init.vim
fi

[[ -f $HOME/.tmux.conf ]] || ln -s $HOME/.dotfiles/.tmux.conf $HOME/.tmux.conf
[[ -f $HOME/.prettierrc.js ]] || ln -s $HOME/.dotfiles/.prettierrc.js $HOME/.prettierrc.js
[[ -f $HOME/.zshrc ]] || echo ". ~/.dotfiles/.zshrc" > ~/.zshrc
[[ -f $HOME/.gitignore ]] || ln -s $HOME/.dotfiles/.gitignore $HOME/.gitignore
[[ -f $HOME/.config/nvim/coc-settings.json ]] || ln -s $HOME/.dotfiles/coc-settings.json $HOME/.config/nvim/coc-settings.json
git config --global core.excludesfile ~/.gitignore

os="`uname`"
if [[ "$os" == 'Darwin' ]]; then
  if [ -x $(which brew) ]; then
    brew install zsh tmux reattach-to-user-namespace mc ag neovim wget curl postgresql python3 nodejs direnv aws-vault ripgrep universal-ctags
    brew install --cask firefox google-chrome iterm2 spectacle karabiner-elements signal slack tableplus
    sudo echo $(which zsh) >> /etc/shells
    sudo chsh -s $(which zsh) $USER
  fi
  defaults write -g ApplePressAndHoldEnabled -bool false
  mkdir -p $HOME/Pictures/screenshots
  defaults write com.apple.screencapture location !$
elif [[ "$os" == 'Linux' ]]; then
  mkdir -p $HOME/.config/Code/User/
  ln -sf $HOME/.dotfiles/Code/User/settings.json $HOME/.config/Code/User/settings.json
  ln -sf $HOME/.dotfiles/Code/User/keybindings.json $HOME/.config/Code/User/keybindings.json
fi
