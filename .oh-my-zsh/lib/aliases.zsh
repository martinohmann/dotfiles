# most used commands
# wrapper script for custom amount of results
most_used_commands() {
	[ ! -z $1 ] || 1=10
	echo Most used commands:
	_most_used_commands $1
}

# actual magic
_most_used_commands() {
	history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n$1
}

# usage: remindme <time> <text>
# e.g.: remindme 10m "omg, the pizza"
remindme() {
    sleep $1 && zenity --info --text "$2" &
}

note () {
	#if file doesn't exist, create it
	[ -f $HOME/.notes ] || touch $HOME/.notes

	#no arguments, print file
	if [ $# = 0 ] 
	then
	cat $HOME/.notes
	#clear file
	elif [ $1 = -c ]
	then
	> $HOME/.notes
	#add all arguments to file
	else
	echo "$@" >> $HOME/.notes
	fi
}

psgrep () {
  ps aux | grep "$1" | grep -v "grep"
}

lsc() {
	ls -Fla --block-size="'1" --color=always --group-directories-first -q "$@" | /home/mohmann/.local/bin/coloredls.pl
}

wg_weather () {
	local api_key='d6c244098ffadf0b'
	local response
	local weather

	response=$(wget -qO - "http://api.wunderground.com/api/$api_key/conditions/q/Germany/Berlin.json")
	weather=$(echo "$response" | jq '.current_observation.temp_c')

	if [[ "$weather" -eq "null" ]]; then
		weather="N/A"
	else
		weather+="°C, "
		weather+=$(echo "$response" | jq -r '.current_observation.weather')
	fi

	echo $weather
}

# translate german to english (with sentence translation w/o quoting. @mohmann)
deen () {
	q=
	for w in $@; do 
		q="$q $w"
	done
	trs {de=en} $q
}

# translate english to german (with sentence translation w/o quoting. @mohmann)
ende () {
	q=
	for w in $@; do 
		q="$q $w"
	done
	trs {en=de} $q
}

# real aliases
# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias -- -='cd -'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias la='ls -a'
alias ll='ls -l'
alias lsd='ls -d */'
alias bc='bc -l'

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
alias history='fc -l 1'
alias mostused='most_used_commands'

# List direcory contents
alias lsa='ls -lah'
alias l='ls -la'
alias ll='ls -l'
alias la='ls -lA'
alias sl=ls # often screw this up
alias lso="ls -lG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"

alias afind='ack-grep -il'

# cat syntax highlighting
cat () {
    source-highlight -i "$1" -o STDOUT -f esc --failsafe
}

# sublime text
alias st='subl'

# wifi
alias wifi='sudo wifi'

# Xilinx 13.1
alias ise='/opt/Xilinx/13.1/ISE_DS/ISE/bin/lin64/ise &'

# colored cat
alias ccat='pygmentize -g'

# tomcat start/stop
alias tomcat-start='/opt/apache-tomcat-6.0.36/bin/startup.sh'
alias tomcat-stop='/opt/apache-tomcat-6.0.36/bin/shutdown.sh'

alias notpacman='love /opt/notpacman-linux/not_pacman.love'
