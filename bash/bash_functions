# functions

# most used commands
mostused() {
	[ ! -z $1 ] || { 1=20; echo "use '$0 [number]' to display more results"; }
	history | awk '{CMD[$2]++;count++;}END { 
		for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | \
		grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n$1
}
# grep for process
psgrep() {
  ps aux | grep "$1" | grep -v "grep"
}
#
# colored ls by mohmann
ls_color() {
	# sed substitutions:
	# - colorize total size (white, underlined)
	# - colorize facl (magenta), hardlinks (red), user (yellow, bold), 
	# 		group (yellow), size (green, bold unit), date (blue)
	# - colorize permissions (d/l: blue, u: yellow, g: cyan, o: green)
	# - recolorize unset permissions (black)
	/bin/ls -Fl --color=always $@ | \
	sed 's/^total.*$/[4;37m&[0m/g
	s/^\([bcdlps-][rwxtsT-]\{9\}\)\(+\?\)\([ ]\+[^ ]\+\)\([ ]\+[^ ]\+\)\([ ]\+[^ ]\+\)\([ ]*[0-9]*[,]\{0,1\}\)\([ ]\+[0-9\.,]\+\)\([KMGTPEZY]\?\)\([ ]\+[^ ]\+[ ]\+[^ ]\+[ ]\+[^ ]\+\)/\1[0;35m\2[0;31m\3[1;33m\4[0;33m\5[0;32m\6[1;32m\7[0;32m\8[0;34m\9[0m/g
		s/^\([bcdlps-]\)\([r-]\)\([w-]\)\([xs-]\)\([r-]\)\([w-]\)\([xs-]\)\([r-]\)\([w-]\)/[0;34m\1[0;33m\2[0;33m\3[0;33m\4[0;36m\5[0;36m\6[0;36m\7[0;32m\8[0;32m\9[0;32m/g
		s/\[0;3[4362]m-/[0;30m-[0;0m/g'
}

_fs() { #$1: name,  $2: search regexp, $3: file or directory
	name=$1
	grep_opts=-RIne
	[ "$name" = "fsi" ] && grep_opts=-RIine
	shift
	[ $# -lt 1 ] && { echo "usage: $name <regexp> [<directory or file>]"; return; }
  dir=$2
	[ -z "$dir" ] && dir=$(pwd)

	egrep $grep_opts "$1" "$dir" #2> /dev/null
}

# find string in files recursively
fs() { #$1: search regexp, $2: file or directory
	_fs "$0" $@
}

# find string in files recursively (case insensitive)
fsi() { #$1: search regexp, $2: file or directory
	_fs "$0" $@
}

