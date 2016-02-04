# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt inc_append_history share_history autocd beep nomatch notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/vladb/.zshrc'

autoload -Uz compinit
compinit

# Completition
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
# End of lines added by compinstall

# Edit command line
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

# Prompt settings
autoload -Uz promptinit
setopt PROMPT_SUBST
promptinit

function git_prompt_info()
{
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    dirty_status=$(git status --porcelain --untracked-files=no --ignore-submodules=dirty)
    branch=${ref#refs/heads/}

    ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
    ZSH_THEME_GIT_PROMPT_SUFFIX="%f%b]"
    ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}"
    ZSH_THEME_GIT_PROMPT_DIRTY="%B%F{red}+"

    if [[ -n $dirty_status ]]; then
        git_prompt="$ZSH_THEME_GIT_PROMPT_DIRTY"
    else
        git_prompt="$ZSH_THEME_GIT_PROMPT_CLEAN"
    fi

    echo "$ZSH_THEME_GIT_PROMPT_PREFIX$git_prompt$branch$ZSH_THEME_GIT_PROMPT_SUFFIX"
}
PROMPT='%F{yellow}%D{%a %b %C %H:%M:}%f %B%F{red}%n%f%b@%m:%B%F{green}%~%f%b%f $(git_prompt_info) (%?)
%{→%}  '

[ -z "$TMUX" ] && export TERM='xterm-256color'

# Terminal title
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

# Aliases
alias 'ls=ls --color' 'll=ls -lhaF'
alias 'grep=grep --color=auto' 'fgrep=fgrep --color=auto' 'egrep=egrep --color=auto'
alias 'xclip=xsel --clipboard'
alias tmux='tmux -2'

# custom aliases
[[ -f ~/.zsh_aliases ]] && . ~/.zsh_aliases

# Autorun stuff
task project:today or +ACTIVE
