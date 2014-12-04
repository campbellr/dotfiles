# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias less='less -R'
fi

# fix display problems in tmux
alias htop="TERM=screen htop"
alias mcabber="TERM=screen mcabber"

# aliases for vplex clusters
alias swanhill="vncviewer -shared 10.6.209.224:3"
alias pewpew="vncviewer -shared 10.6.209.7:3"
alias ford="vncviewer -shared 10.6.215.83:3"
alias fuego="vncviewer -shared 10.6.209.207:3"
alias zulu="vncviewer -shared 10.6.211.198:3"
alias shadowcat="vncviewer -shared 10.6.209.39:3"
alias terrapin="vncviewer -shared 10.6.210.124:3"
alias glados="vncviewer -shared 10.6.209.209:3"
alias biggie="vncviewer -shared 10.6.209.21:2"
alias minos="vncviewer -shared 10.6.209.205:2"
alias midgard="vncviewer -shared 10.6.209.211:3"
alias asdf="vncviewer -shared 10.6.209.63:2"
alias cobalt="vncviewer -shared dsvef117:4"
alias mocha="vncviewer -shared 10.6.209.91:3"
alias gator="vncviewer -shared 10.6.209.99:3"
