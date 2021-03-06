# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

git_branch_name() {
  git symbolic-ref HEAD 2> /dev/null | cut -d"/" -f 3
}

git_branch_prompt() {
  local branch=$(git_branch_name)

  if [ $branch ]; then
    echo "${branch}"
  else
    echo "no_branch!"
  fi
}

pwd_is_git_repo() {
  git rev-parse 2> /dev/null
}

venv_prompt() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo -ne " \033[00;33mvenv:(\033[00;36m${VIRTUAL_ENV##*/}\033[00;33m)"
  fi
}

export VIRTUAL_ENV_DISABLE_PROMPT=1

PS1="${debian_chroot:+($debian_chroot)}\[\033[00;32m\]\u\
\[\033[00;37m\]@\h\[\033[00m\] \
\[\033[00;36m\]\w\[\033[00;32m\]\
\$(pwd_is_git_repo && \
  echo -n \" \[\033[00;32m\]git:(\[\033[00;31m\]\$(git_branch_prompt)\" && \
  echo -n \"\[\033[00;32m\])\")\$(venv_prompt) \[\033[00;37m\]% \[\033[00m\]"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# unset GREP_OPTIONS since it is deprecated
unset GREP_OPTIONS

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# android sdk paths
export PATH=$PATH:/opt/android-sdk-linux/platform-tools:/opt/android-sdk-linux/tools

# bcrc
export BC_ENV_ARGS=~/.bcrc

# load bash functions
source $HOME/.bash_functions

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
