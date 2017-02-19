# Based on robbyrussell's theme, with host and rvm indicators. Example:
# @host ➜ currentdir rvm:(rubyversion@gemset) git:(branchname)

# Get Virtual Env
venv_prompt_info() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo -n " %{$fg[yellow]%}venv:(%{$fg[cyan]%}${VIRTUAL_ENV##*/}%{$fg[yellow]%})%{$reset_color%}"
  fi
}

# Get the current ruby version in use with RVM:
if [ -e ~/.rvm/bin/rvm-prompt ]; then
    RUBY_PROMPT_=" %{$fg[cyan]%}rvm:(%{$fg[yellow]%}\$(~/.rvm/bin/rvm-prompt s i v g)%{$fg[cyan]%})%{$reset_color%}"
else
  if which rbenv &> /dev/null; then
    RUBY_PROMPT_=" %{$fg[cyan]%}rvm:(%{$fg[yellow]%}\$(rbenv version | sed -e 's/ (set.*$//')%{$fg[cyan]%})%{$reset_color%}"
  fi
fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%} git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%})"

VENV_PROMPT_="\$(venv_prompt_info)"

# slightly different prompt for TTY
if [ -z "$DISPLAY" ] && [ -z "$SSH_CLIENT" ] && [ -z "$SSH_TTY" ]; then
	ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}) %{$fg_bold[yellow]%}x%{$reset_color%}"
	HOST_PROMPT_="%{$fg_bold[black]%}=> %{$fg_no_bold[white]%}%{$fg_bold[black]%}[%{$fg_bold[blue]%}%~%{$fg_bold[black]%}]%{$reset_color%}"
	GIT_PROMPT="\$(git_prompt_info)%{$reset_color%}"
	PROMPT="$HOST_PROMPT_$RUBY_PROMPT_$GIT_PROMPT$VENV_PROMPT_%{$fg_bold[black]%}: %{$reset_color%}"
	RPROMPT="%{$reset_color%}%{$fg_bold[black]%}[%{$fg_no_bold[white]%}%* %{$fg_bold[black]%}h# %{$fg_no_bold[white]%}%! %{$fg_bold[black]%}\\\$? %{$fg_no_bold[white]%}%?%{$fg_bold[black]%}]%{$reset_color%}"
else 
	ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}) %{$fg[yellow]%}x%{$reset_color%}"
	HOST_PROMPT_="%{$fg_no_bold[black]%}=> %{$reset_color%}%{$fg[black]%}[%{$fg_no_bold[blue]%}%~%{$fg[black]%}]%{$reset_color%}"
	GIT_PROMPT="\$(git_prompt_info)%{$reset_color%}"
	PROMPT="$HOST_PROMPT_$RUBY_PROMPT_$GIT_PROMPT$VENV_PROMPT_%{$fg_no_bold[black]%}: %{$reset_color%}"
	RPROMPT="%{$reset_color%}%{$fg_no_bold[black]%}[%{$fg_no_bold[white]%}%* %{$fg_no_bold[black]%}h# %{$fg_no_bold[white]%}%! %{$fg_no_bold[black]%}\\\$? %{$fg_no_bold[white]%}%?%{$fg_no_bold[black]%}]%{$reset_color%}"
fi
