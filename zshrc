fpath=(/usr/local/share/zsh/site-functions /usr/local/share/zsh-completions $fpath)

eval "$(rbenv init -)"

export ZSH=$HOME/.zsh
export PAGER=vimpager

HISTFILE=$ZSH/history
HISTSIZE=10000
SAVEHIST=10000

autoload -U compaudit

for zsh_file ($ZSH/lib/*.zsh); do
  source $zsh_file
done


autoload -U colors && colors
unset LSCOLORS
export CLICOLOR=1
export LS_COLORS=gxfxcxdxbxegedabagacad

# Load and run compinit
autoload -U compinit
zmodload -i zsh/complist
compinit -i 

# URL-Quote-Magic
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Activate Online-Help
#unalias run-help
#autoload run-help
#HELPDIR=/usr/local/share/zsh/helpfiles

setopt prompt_subst
autoload -U promptinit
promptinit

setopt prompt_subst

PROMPT='in %{$FG[192]%}%3c %{$fg[blue]%}$(git_prompt_info)%{$fg[blue]%}
%{$reset_color%}$%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

bindkey '^[[Z' reverse-menu-complete

alias ll="ls -la"

# Adding android-sdk-bins
export PATH=$HOME/Development/android-sdk-macosx/tools:$HOME/Development/android-sdk-macosx/platform-tools:$PATH

#source /usr/local/share/zsh/site-functions/_youtube-dl
source $ZSH/plugins/git.zsh
