# ------------------------------------------------------------------------
# Juan G. Hurtado oh-my-zsh theme
# (Needs Git plugin for current_branch method)
# ------------------------------------------------------------------------

# Color shortcuts
RED=$fg[red]
YELLOW=$fg[yellow]
GREEN=$fg[green]
WHITE=$fg[white]
BLUE=$fg[blue]
RED_BOLD=$fg_bold[red]
YELLOW_BOLD=$fg_bold[yellow]
GREEN_BOLD=$fg_bold[green]
WHITE_BOLD=$fg_bold[white]
BLUE_BOLD=$fg_bold[blue]
RESET_COLOR=$reset_color

# Format for git_prompt_info()
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""

# Format for parse_git_dirty()
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$RED%}(*)"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# Format for git_prompt_status()
ZSH_THEME_GIT_PROMPT_UNMERGED=" %{$RED%}unmerged"
ZSH_THEME_GIT_PROMPT_DELETED=" %{$RED%}deleted"
ZSH_THEME_GIT_PROMPT_RENAMED=" %{$GREEN%}renamed"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %{$BLUE%}modified"
ZSH_THEME_GIT_PROMPT_ADDED=" %{$GREEN%}added"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$WHITE%}untracked"

# Format for git_prompt_ahead()
ZSH_THEME_GIT_PROMPT_AHEAD=" %{$RED%}(!)"

# Format for git_prompt_long_sha() and git_prompt_short_sha()
ZSH_THEME_GIT_PROMPT_SHA_BEFORE=" %{$WHITE%}[%{$YELLOW%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$WHITE%}]"

#PATH="$PATH:/Users/indoril/Scripts/"
#function battery_charge {
#    echo `batcharge.py` 2>/dev/null
#}

#function precmd {
#	CHARGE="$(battery_charge)"
#}

function virtualenv_info { [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') ' }

# Prompt format
PS1=$'┌─%(?..[%F{red}%?%f] )%b%F{blue}%n%b%F{white}@%b%F{green}%m%b:%F{green}%~%f%u$(parse_git_dirty)$(git_prompt_ahead)%{$RESET_COLOR%}\n└─%B>>= %b%f'
RPS1=$'%{$fg[green]%}$(virtualenv_info)%{$reset_color%}% %B%(1v.%F{yellow}%1v%f.)%f%b%f%T%f--%F{red}%w%f%f %{$BLUE%}$(current_branch)%{$RESET_COLOR%}'
