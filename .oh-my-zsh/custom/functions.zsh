# functions

# most used commands
mostused() {
	[ ! -z $1 ] || { 1=20; echo "use '$0 [number]' to display more results"; }
	history | awk '{CMD[$2]++;count++;}END { 
		for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | \
		grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n$1
}

# make a note
note() {
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
mergepdf() {
	[[ $# -lt 2 ]] && { echo "usage: $0 <outfile> <infile> [<infile2> ...]"; return; }
	local out=$1
	shift
	/usr/bin/gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=$out $@
}

# grep for process
psgrep() {
  ps aux | grep "$1" | grep -v "grep"
}

# wrapper for colored ls by vain
lsc() {
	ls -Fla --block-size="'1" --color=always --group-directories-first \
		-q "$@" | $HOME/.local/bin/coloredls.pl
}

# colored ls by mohmann
ls_color() {
	# sed substitutions:
	# - colorize total size (white, underlined)
	# - colorize facl (magenta), hardlinks (red), user (yellow, bold), 
	# 		group (yellow), size (green, bold unit), date (blue)
	# - colorize permissions (d/l: blue, u: yellow, g: cyan, o: green)
	# - recolorize unset permissions (black)
	/usr/bin/ls -Fl --color=always $@ | \
        sed 's/^total.*$/\x1B[4;37m&\x1B[0m/g
	    s/^\([bcdlps-][rwxtsT-]\{9\}\)\(+\?\)\([ ]\+[^ ]\+\)\([ ]\+[^ ]\+\)\([ ]\+[^ ]\+\)\([ ]*[0-9]*[,]\{0,1\}\)\([ ]\+[0-9\.,]\+\)\([KMGTPEZY]\?\)\([ ]\+[^ ]\+[ ]\+[^ ]\+[ ]\+[^ ]\+\)/\1\x1B[0;35m\2\x1B[0;31m\3\x1B[1;33m\4\x1B[0;33m\5\x1B[0;32m\6\x1B[1;32m\7\x1B[0;32m\8\x1B[0;34m\9\x1B[0m/g
		  s/^\([bcdlps-]\)\([r-]\)\([w-]\)\([xs-]\)\([r-]\)\([w-]\)\([xs-]\)\([r-]\)\([w-]\)/\x1B[0;34m\1\x1B[0;33m\2\x1B[0;33m\3\x1B[0;33m\4\x1B[0;36m\5\x1B[0;36m\6\x1B[0;36m\7\x1B[0;32m\8\x1B[0;32m\9\x1B[0;32m/g
		  s/\x1B\[0;3[4362]m-/\x1B[0;30m-\x1B[0;0m/g'
}

# cat syntax highlighting
# cat() {
#   source-highlight -i "$1" -o STDOUT -f esc --failsafe
# }

# change dir and list
cdl() {
	cd "$1" && ls -l
}

# colored pstree
pstree_color() {
	pstree -U "$@" | sed '
		s/[-a-zA-Z]\+/\x1B[32m&\x1B[0m/g
		s/[{}]/\x1B[31m&\x1B[0m/g
		s/[─┬─├─└│]/\x1B[34m&\x1B[0m/g'
}

_fs() { #$1: name,  $2: search regexp, $3: file or directory
	name=$1
	grep_opts=-RIne
	[ "$name" = "fsi" ] && grep_opts=-RIine
	shift
	[ $# -lt 1 ] && { echo "usage: $name <regexp> [<directory or file>]"; return; }
	[ -z "$2" ] && 2=$(pwd)

	egrep $grep_opts "$1" "$2" #2> /dev/null
}

# find string in files recursively
fs() { #$1: search regexp, $2: file or directory
	_fs "$0" $@
}

# find string in files recursively (case insensitive)
fsi() { #$1: search regexp, $2: file or directory
	_fs "$0" $@
}


# colored less
cless() {
	pygmentize -g "$1" | less -R
}

# ls color human readable sed
ls_color_hr() {
	blk="\x1B[0;30m"
	red="\x1B[0;31m"
	grn="\x1B[0;32m"
	grnb="\x1B[1;32m"
	yel="\x1B[0;33m"
	yelb="\x1B[1;33m"
	blu="\x1B[0;34m"
	mag="\x1B[0;35m"
	cya="\x1B[0;36m"
	whiu="\x1B[4;37m"
	rst="\x1B[0;0m"

	ls -Fl --color=always $@ | \
	sed "s/^total.*$/${whiu}&${rst}/g
		s/^\([rwxdtsTl-]\{10\}\)\(+\?\)\([ ]\+[0-9]\+\)\([ ]\+[a-z-]\+\)\([ ]\+[a-z-]\+\)\([ ]\+[0-9\.]\+\)\([KMGT]\?\)\([ ]\+[^ ]\+[ ]\+[^ ]\+[ ]\+[^ ]\+\)/\1${mag}\2${red}\3${yelb}\4${yel}\5${grnb}\6${grn}\7${blu}\8${rst}/g
		s/^\([ld-]\)\([r-]\)\([w-]\)\([xs-]\)\([r-]\)\([w-]\)\([xs-]\)\([r-]\)\([w-]\)/${blu}\1${yel}\2${yel}\3${yel}\4${cya}\5${cya}\6${cya}\7${grn}\8${grn}\9${grn}/g
		s/\x1B\[0;3[2346]m-/${blk}-/g"
}

da() {
	watch -ctn 1 "(echo -e '\033[32mGID\t\t Name\t\t\t\t\t\t      %     Down   Size   Speed   Up  S/L   Time\033[36m'; \
		diana list| cut -c -112; echo -e '\033[37m'; diana stats)"
}      

tempd() {
  dir=$(mktemp -d)
  cd "$dir"
}

bc_convert() {
  # $1: ibase
  # $2: obase, in ibase notation
  # $3: val
  if [ $1 -gt 10 ]; then
    val=$(echo $3 | tr '[:lower:]' '[:upper:]')
  else
    val=$3
  fi

  val=${val#0X}
  res=$(echo "obase=$2; ibase=$1; $val" | bc)

  if [ $2 -gt 10 ]; then
    res=$(echo $res | tr '[:upper:]' '[:lower:]')
  fi

  if [ $2 -eq 2 ]; then
    res="b$res"
  elif [ $2 -eq 8 ]; then
    res="o$res"
  elif [ $2 -eq 16 ]; then
    res="0x$res"
  fi

  echo $res
}

# hex to dec
h2d() { bc_convert 16 10 $1; }

# dec to hex
d2h() { bc_convert 10 16 $1; }

# bin to dec
b2d() { bc_convert 2 10 $1; }

# dec to bin
d2b() { bc_convert 10 2 $1; }

# bin to hex
b2h() { bc_convert 2 16 $1; }

# dec to bin
h2b() { bc_convert 16 2 $1; }

## bash and zsh only!
# functions to cd to the next or previous sibling directory, in glob order

prev() {
  # default to current directory if no previous
  local prevdir="./"
  local cwd=${PWD##*/}
  if [[ -z $cwd ]]; then
    # $PWD must be /
    echo 'No previous directory.' >&2
    return 1
  fi
  for x in ../*/ ../.*/; do
    if [[ ${x#../} == ${cwd}/ ]]; then
      # found cwd
      if [[ $prevdir == ./ ]]; then
        echo 'No previous directory.' >&2
        return 1
      fi
      cd "$prevdir"
      return
    fi
    if [[ -d $x ]]; then
      prevdir=$x
    fi
  done
  # Should never get here.
  echo 'Directory not changed.' >&2
  return 1
}

next() {
  local foundcwd=
  local cwd=${PWD##*/}
  if [[ -z $cwd ]]; then
    # $PWD must be /
    echo 'No next directory.' >&2
    return 1
  fi
  for x in ../*/ ../.*/; do
    if [[ -n $foundcwd ]]; then
      if [[ -d $x ]]; then
        cd "$x"
        return
      fi
    elif [[ ${x#../} == ${cwd}/ ]]; then
      foundcwd=1
    fi
  done
  echo 'No next directory.' >&2
  return 1
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z
