export ZSH=$HOME/.zsh
export PAGER=vimpager

HISTFILE=$ZSH/history
HISTSIZE=10000
SAVEHIST=10000

for zsh_file ($ZSH/lib/*.zsh); do
  source $zsh_file
done

export PATH=/usr/local/share/npm/bin:/Applications/SenchaSDKTools-2.0.0-Beta/bin:$HOME/bin:$PATH

export ANDROID_SDK_HOME=$HOME/android-sdks

export PATH=$HOME/Development/cordova/node_modules/cordova/bin:$ANDROID_SDK_HOME/tools:$ANDROID_SDK_HOME/platform-tools:$HOME/bin:$HOME/.rbenv/shims:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:/usr/local/share/npm/bin

eval "$(rbenv init -)"

autoload -U colors && colors
unset LSCOLORS
export CLICOLOR=1
export LS_COLORS=gxfxcxdxbxegedabagacad


# Load and run compinit
autoload -U compinit
compinit -i 

# URL-Quote-Magic
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Activate Online-Help
#unalias run-help
#autoload run-help
#HELPDIR=/usr/local/share/zsh/helpfiles

PROMPT="%{$fg[cyan]%}[%T]%{$reset_color%} %n@%M:%3c
%{$fg[green]%}=>%{$reset_color%} "

bindkey '^[[Z' reverse-menu-complete
