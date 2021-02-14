# aliases
# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias -- -='cd -'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lsd='ls -d */'
#alias j='jump'

# List direcory contents
#alias l='ls -lah'
alias ls='ls -F --color=auto'
alias l='ls_color -ah'
alias ll='ls_color'
alias la='ls_color -a'
alias lg='ls_color -a --group-directories-first'
alias sl=ls # often screw this up
alias lso="ls -lG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"

# Super user
alias _='sudo'
alias please='sudo'
alias chmod='chmod --preserve-root'

# Ssh
alias ssh='TERM=xterm-256color ssh'

# Pacman
alias orphans='pacman -Qqdt'
alias selfinstalled='pacman -Qqet'
alias pacinfo='pacman -Qi'

# Open files
alias o='xdg-open'

# grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Show history
alias hist='fc -l 1'

alias afind='ack-grep -il'

# sublime text
alias st='subl'

# Xilinx 13.1
alias ise='/opt/Xilinx/13.1/ISE_DS/ISE/bin/lin64/ise &'

# colored cat
alias ccat='pygmentize -g'

# use math lib
alias bc='bc -l'

# sudo wifi
alias wifi='sudo wifi'

# tomcat start/stop
alias tomcat-start='/opt/apache-tomcat-6.0.36/bin/startup.sh'
alias tomcat-stop='/opt/apache-tomcat-6.0.36/bin/shutdown.sh'

# set pulse audio sinkport
alias sinkport='pacmd set-sink-port alsa_output.pci-0000_00_1b.0.analog-stereo'

# forgot sudo?
# old alias
#alias fuck='sudo $(cat $(readlink -f $HISTFILE) | tail -n2 | head -n1 | cut -d\; -f2-)'
alias fuck='sudo $(tail -2 $HISTFILE | head -1 | cut -d\; -f2-)'

# colordiff
alias diff='colordiff'

# shorter colored less
alias le='cless'

alias mathpy='PYTHONSTARTUP=~/.math-interactive.py python'

# knife
alias kcu='knife cookbook upload'
alias krff='knife role from file'
alias kdb='knife data bag'

# vim
alias vi=nvim
alias vim='nvim -w ~/.nvim-keylog "$@"'
alias vimdiff='nvim -d'

# ruby observr
alias ob='observr autotest.rb'

alias wanip='dig +short myip.opendns.com @resolver1.opendns.com'

# exercism
alias efg='exercism fetch go'
alias es='exercism submit'
alias eg='cd $HOME/exercism/go/$(ls -t $HOME/exercism/go/ | head -1)'
alias gtb='go test -bench .'
