[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.fzf.bash ] && . ~/.fzf.bash

export EDITOR=nvim

export GOPATH="$HOME/go"

# Add Go stuff to $PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin

# Add ~/bin to $PATH
export PATH=$PATH:$HOME/bin/

# Add perl stuff to $PATH
export PATH=$PATH:$HOME/perl5/bin/

# Add python (3) stuff to $PATH
export PATH=$HOME/Library/Python/3.7/bin/:$PATH

# nvm
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# aliases (should really pull into ~/.bash_aliases)
alias vim="nvim"
alias view="nvim -R"
alias vimdiary="nvim -c :VimwikiDiaryIndex"
alias vimwiki="nvim -c :VimwikiIndex"

# git prompt stuff
export GIT_PS1_SHOWSTASHSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=true

PROMPT_COMMAND='__git_ps1 "\u:\w" "\\\$ "'

# history stuff
# infinite history
export HISTFILESIZE=
export HISTSIZE=
# add timestamps to history file
export HISTTIMEFORMAT="[%F %T] "
shopt -s histappend
shopt -s cmdhist

# flush history to file after every command 
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# shellcheck source=/dev/null
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="/usr/local/opt/openssl/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"

export BLUEMIX_API_KEY=6b54t1mcU-dySwT07kjgKxSQCCyr7fjsUc7QxznV_Yns

# shellcheck source=/dev/null
source "$HOME/.functions"
