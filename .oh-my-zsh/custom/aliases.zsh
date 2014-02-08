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
alias j='jump'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias la='ls -la'
alias sl=ls # often screw this up
alias lso="ls -lG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"

# Super user
alias _='sudo'
alias please='sudo'

# Pacman
alias orphans='pacman -Qqdt'
alias selfinstalled='pacman -Qqet'

# Open files
alias o='xdg-open'
#alias g='grep -in'

# Show history
alias hist='fc -l 1'
alias mostused='most_used_commands'

alias afind='ack-grep -il'

# sublime text
alias st='subl'

# Xilinx 13.1
alias ise='/opt/Xilinx/13.1/ISE_DS/ISE/bin/lin64/ise &'

# colored cat
alias ccat='pygmentize -g'

# use math lib
alias bc='bc -l'

# tomcat start/stop
alias tomcat-start='/opt/apache-tomcat-6.0.36/bin/startup.sh'
alias tomcat-stop='/opt/apache-tomcat-6.0.36/bin/shutdown.sh'
