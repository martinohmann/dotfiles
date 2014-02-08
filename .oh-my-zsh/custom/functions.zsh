# functions

# most used commands
most_used_commands() {
	[ ! -z $1 ] || 1=10
	echo "Most used commands:"
	history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n$1
}

# make a note
note () {
	#if file doesn't exist, create it
	[ -f $HOME/.notes ] || touch $HOME/.notes

	if [ $# = 0 ]; then
		# no arguments, print file
		cat $HOME/.notes
	elif [ $1 = -c ]; then
		# clear file
		rm $HOME/.notes
	else
		# add all arguments to file
		echo "$@" >> $HOME/.notes
	fi
}

# merge pdfs with ghostscript
merge_pdf() {
	[[ $# -lt 2 ]] && { echo "Usage: $0 <outfile> <infile> [<infile2> ...]"; exit 1; }
	local out=$1
	shift
	/usr/bin/gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$out $@
}

# grep for process
psgrep () {
  ps aux | grep "$1" | grep -v "grep"
}

# wrapper for colored ls
lsc() {
	ls -Fla --block-size="'1" --color=always --group-directories-first -q "$@" | $HOME/.local/bin/coloredls.pl
}

# translate german to english (with sentence translation w/o quoting. @mohmann)
deen () {
	local q
	for w in $@; do q="$q $w"; done
	/usr/bin/trs {de=en} $q
}

# translate english to german (with sentence translation w/o quoting. @mohmann)
ende () {
	local q
	for w in $@; do q="$q $w"; done
	/usr/bin/trs {en=de} $q
}

# cat syntax highlighting
cat () {
  source-highlight -i "$1" -o STDOUT -f esc --failsafe
}

# colored pstree
pstree_color () {
	pstree -U "$@" | sed '
		s/[-a-zA-Z]\+/\x1B[32m&\x1B[0om/g
		s/[{}]/\x1B[31m&\x1B[0m/g
		s/[─┬─├─└│]/\x1B[34m&\x1B[0m/g'
}

# set terminal font size
fsize() {
	local delta

	if [[ $# -ge 1 ]]; then
		case "$1" in
			"+") 
				MO_FONTSIZE=$((MO_FONTSIZE+1));;
			"-") 
				MO_FONTSIZE=$((MO_FONTSIZE-1));;
			*) 
				[[ "$1" =~ ^[0-9]+$ ]] && MO_FONTSIZE=$1
				[[ "$1" =~ ^[+-][0-9]+$ ]] && { delta=$1; MO_FONTSIZE=$((MO_FONTSIZE+delta)); }
				;;
		esac
		[[ $MO_FONTSIZE -le 6 ]] && MO_FONTSIZE=6
		[[ $MO_FONTSIZE -gt 80 ]] && MO_FONTSIZE=80
	else
		MO_FONTSIZE=$MO_DEFAULT_FONTSIZE
	fi
	echo "new fontsize: $MO_FONTSIZE"
	printf '\33]50;%s%d%s\007' "-*-ohsnap-medium-r-normal-*-" $MO_FONTSIZE "-*-*-*-*-*-*-*"
}
