# add $HOME/.zfunctions to fpath
fpath=( "$HOME/.zfunctions" $fpath )

# use prettier term in emulators
# if [ -n "$DISPLAY" ]; then
	# export real term
	# export REAL_TERM="$TERM"

	# if [[ -e /usr/share/terminfo/x/xterm-256color ]]; then
	# 	export TERM='xterm-256color'
	# else
	# 	export TERM='xterm-color'
	# fi
# fi

# set correct term variable in xfce4-terminal
# if [ -e /usr/share/terminfo/x/xterm-256color ] && [ "$COLORTERM" = "xfce4-terminal" ]; then
#     export TERM=xterm-256color
# fi
# export TERM=xterm-256color

# set terminfo keys
# export TERMINFO=~/.terminfo

# mute terminal
setopt no_beep

## ENV variables
# default applications
export EDITOR="nvim"
export BROWSER="chromium"

# hide default venv prompt
export VIRTUAL_ENV_DISABLE_PROMPT=1

# export WORKON_HOME=~/.virtualenvs
# source /usr/bin/virtualenvwrapper.sh

# add /usr/lib:/usr/local/lib to LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:$LD_LIBRARY_PATH

# dircolors
[ -f ~/.dircolors ] && eval $(dircolors -b ~/.dircolors)

# prevent java applications from freezing X11
export GDK_NATIVE_WINDOWS=true

# add usrscripts to PATH
export PATH=$PATH:$HOME/.local/bin:$HOME/.config/composer/vendor/bin

# add gopath
export GO111MODULE=on
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin"

# add java home
export JAVA_HOME=/usr/lib/jvm/default

# add global yarn node_modules to path
export PATH=$PATH:$HOME/.config/yarn/global/node_modules/.bin

# rubygems
export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH

export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

## >>> START oh-my-zsh specific
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="mohmann3"
ZSH_THEME=""

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# max buffer length for autosuggstions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=100

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  colored-man-pages
  docker
  docker-compose
  extract
  git
  history-substring-search
  kubectl
  sudo
  systemd
  zsh-syntax-highlighting
)

if [ -n "$DISPLAY" ] || [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  plugins+=(zsh-autosuggestions)
fi

source $ZSH/oh-my-zsh.sh
## <<< END oh-my-zsh-specific

# disable ctrl-s
stty -ixon

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "^H" backward-delete-word

# # for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line

# for zsh-autosuggestions
bindkey '^ ' autosuggest-accept

# autostartx on tty1 only
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx > /tmp/xorg-$USER.stdout 2> /tmp/xorg-$USER.stderr

export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore --follow --glob "!.git/*" --no-messages'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.tmuxinator.zsh ] && source ~/.tmuxinator.zsh
[ -f ~/.google-cloud-sdk/path.zsh.inc ] && source ~/.google-cloud-sdk/path.zsh.inc
[ -f ~/.google-cloud-sdk/completion.zsh.inc ] && source ~/.google-cloud-sdk/completion.zsh.inc

# autoload -U promptinit; promptinit

# PLAINBOW_BG_JOBS=1
# PLAINBOW_FULL_CWD=1
# PLAINBOW_GIT_PULL=1
# PLAINBOW_GIT_UNTRACKED_DIRTY=1

# prompt plainbow

source <(kickoff completion zsh)
source <(gh completion -s zsh)

export BAT_THEME=Nord

eval "$(starship init zsh)"
