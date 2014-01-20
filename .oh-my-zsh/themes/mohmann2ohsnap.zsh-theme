# Based on robbyrussell's theme, with host and rvm indicators. Example:
# @host ➜ currentdir rvm:(rubyversion@gemset) git:(branchname)

# Get the current ruby version in use with RVM:
if [ -e ~/.rvm/bin/rvm-prompt ]; then
    RUBY_PROMPT_=" %{$fg[blue]%}rvm:(%{$fg[green]%}\$(~/.rvm/bin/rvm-prompt s i v g)%{$fg[blue]%})%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    RUBY_PROMPT_=" %{$fg[blue]%}rvm:(%{$fg[green]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$fg[blue]%})%{$reset_color%}"
  fi
fi

ZSH_THEME_GIT_PROMPT_PREFIX=" git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%})"

# slightly different prompt for TTY
if [ -z $DISPLAY ]; then
	ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}) %{$fg[yellow]%}x%{$reset_color%}"
	HOST_PROMPT_="%{$fg_bold[black]%}-> %{$fg_bold[white]%}%-1m %{$fg_bold[black]%}[%{$fg_no_bold[cyan]%}%~%{$fg_bold[black]%}]"
else 
	ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}) %{$fg[yellow]%}✗%{$reset_color%}"
	HOST_PROMPT_="%{$fg[white]%}→ %{$reset_color%}%-1m %{$fg[white]%}[%{$fg_no_bold[cyan]%}%~%{$fg[white]%}]"
fi

# HOST_PROMPT_="%{$fg[blue]%}@%-1m - %{$fg[cyan]%}%~"
GIT_PROMPT="%{$fg[green]%}\$(git_prompt_info)%{$reset_color%}"
PROMPT="$HOST_PROMPT_$RUBY_PROMPT_$GIT_PROMPT%{$fg[white]%}: %{$reset_color%}"
RPROMPT="%{$reset_color%}[%? %*]%{$reset_color%}"

