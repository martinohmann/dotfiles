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
export TERM=xterm-256color

# set terminfo keys
# export TERMINFO=~/.terminfo

# mute terminal
setopt no_beep

## ENV variables
# default applications
export EDITOR="nvim"
export BROWSER="chromium"

# hide default venv prompt
# export VIRTUAL_ENV_DISABLE_PROMPT=1

# export WORKON_HOME=~/.virtualenvs
# source /usr/bin/virtualenvwrapper.sh
# source /usr/local/bin/virtualenvwrapper.sh

# add /usr/lib:/usr/local/lib to LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/lib:/usr/local/lib:$LD_LIBRARY_PATH

# dircolors
[ -f ~/.dircolors ] && eval $(dircolors -b ~/.dircolors)

# prevent java applications from freezing X11
export GDK_NATIVE_WINDOWS=true

# add usrscripts to PATH
export PATH=$HOME/.local/bin:$HOME/.config/composer/vendor/bin:$PATH

# homebrew core-utils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# homebrew ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"

# add gopath
export GO111MODULE=on
export GOPATH="$HOME/.go"
export PATH="$PATH:$GOPATH/bin"

# add android tools to PATH
#export PATH=$PATH:/opt/android-sdk-linux/tools:/opt/android-sdk-linux/platform-tools
#
# add grails to PATH
# export PATH=$PATH:/opt/grails/current/bin
# export GRAILS_HOME=/opt/grails/current
# export JAVA_HOME=/usr/lib/jvm/default

# add android sdk path
# export ANDROID_HOME=/opt/android-sdk
# export PATH=$PATH:/opt/android-sdk/tools:/opt/android-sdk/platform-tools
#
# knife config
#
# export KNIFE_CONF_PATH=$HOME/work/chef-repo/.chef/knife.rb
# export KNIFE_COOKBOOK_PATH=$HOME/work/chef-repo/site-cookbooks

# add global yarn node_modules to path
# export PATH=$PATH:$HOME/.config/yarn/global/node_modules/.bin

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
  igit
  kubectl
  sudo
  systemd
  zsh-syntax-highlighting
)

if [ -n "$ZSH_AUTOSUGGEST_FORCE_ENABLE" ] || [ -n "$DISPLAY" ] || [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  plugins+=(zsh-autosuggestions)
fi

source $ZSH/oh-my-zsh.sh
## <<< END oh-my-zsh-specific

# unset GREP_OPTIONS since it is deprecated
# unset GREP_OPTIONS

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

# chef shell-init is fucking slow, cache it
# [ -f ~/.chef-shell-init.zsh ] || chef shell-init zsh > ~/.chef-shell-init.zsh

# source ~/.chef-shell-init.zsh

# autostartx on tty1 only. why has this to be down here?! strange behaviour
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

export FZF_DEFAULT_COMMAND='rg --files --hidden --no-ignore --follow --glob "!.git/*" --no-messages'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# [ -e ~/.phpbrew/bashrc ] && source ~/.phpbrew/bashrc

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/.google-cloud-sdk/path.zsh.inc ]; then source ~/.google-cloud-sdk/path.zsh.inc; fi
if [ -f ~/.google-cloud-sdk/completion.zsh.inc ]; then source ~/.google-cloud-sdk/completion.zsh.inc; fi

# export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh

# source <(helm completion zsh)
[ -f ~/.local/bin/tmuxinator.zsh ] && source ~/.local/bin/tmuxinator.zsh

autoload -U promptinit; promptinit

PLAINBOW_BG_JOBS=1
PLAINBOW_FULL_CWD=1
PLAINBOW_GIT_PULL=1
PLAINBOW_GIT_UNTRACKED_DIRTY=1

prompt plainbow

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/martin.ohmann/.sdkman"
[[ -s "/Users/martin.ohmann/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/martin.ohmann/.sdkman/bin/sdkman-init.sh"

# krew path
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
