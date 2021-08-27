#!/bin/sh
#
# Install all necessary system packages and utilities

set -ex

if [ ! -d "$HOME/bin" ]; then
    mkdir "$HOME/bin"
fi

# neovim
if [ ! -f ~/bin/nvim ]; then
    curl -s https://github.com/neovim/neovim/releases/download/v0.5.0/nvim.appimage -o $HOME/bin/nvim
fi

# golang
if [ ! -f /usr/local/go/bin/go ]; then
    curl -L -s https://golang.org/dl/go1.17.linux-amd64.tar.gz -O
    rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.17.linux-amd64.tar.gz
    rm -f go1.17.linux-amd64.tar.gz
fi

# apt packages
sudo apt install \
  fd-find \
  fzf \
  git \
  htop \
  ripgrep \
  rustc \
  tig \
  tmux \
  zsh

# diff-highlight
if [ ! -f /usr/local/bin/diff-highlight ]; then
  sudo ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight /usr/local/bin
  sudo chmod a+x /usr/share/doc/git/contrib/diff-highlight/diff-highlight
fi

# git delta (https://github.com/dandavison/delta)
if [! -f "$HOME/.cargo/bin/delta" ]; then
  cargo install git-delta
fi

# vim-plug
if [ ! -d "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
    curl -fLo "$HOME/.local/share/nvim/site/autoload/plug.vim" --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
# zsh-autosuggest & zsh-syntax-highlighting
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom/"
ZSH_AUTOSUGGEST_DIR="$ZSH_CUSTOM/plugins/zsh-autosuggestions"
ZSH_SYNTAX_HIGHLIGHTING_DIR="$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

if [ ! -d "$ZSH_AUTOSUGGEST_DIR" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git \
      $ZSH_AUTOSUGGEST_DIR
fi

if [ ! -d "$ZSH_SYNTAX_HIGHLIGHTING_DIR" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
      $ZSH_SYNTAX_HIGHLIGHTING_DIR
fi

# Install the dotfiles
./bin/dfm install

# Install vim plugins with vim-plug
nvim --headless +PlugInstall +qall
