umask 077
export CLICOLOR=1
export PS1="\e[1;38;5;242m[\@] \e[0;38;5;195m\u@\h:\e[0;38;5;25m\w\e[1;38;5;249m \n$ \e[0;38;5;253m"
export LS_COLORS="rs=0:di=01;34:ln=35;03:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;07:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=31:"
export EDITOR="vim"

alias clr="clear"
alias s="vi ~/.bash_profile"
alias q="exit"
alias c="clear"
alias re="reset"
alias h="cd"
#alias ls="ls --color=auto"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias up="cd ..; c; pwd"
alias chrome="open -a Google\ Chrome"

export PATH=$PATH:$HOME/bin:/usr/local/bin:$HOME/.local/bin

fortune | cowsay | lolcat

echo \"The best time to plant a tree was 20 years ago. The second best time is now.\"
