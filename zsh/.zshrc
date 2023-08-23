# AUTOCOMPLETION

# initialize autocompletion
autoload -U compinit && compinit

# history setup
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# source antidote
# Set antidote home to local cache
export ANTIDOTE_HOME=~/.cache/antidote
if [[ $(uname) == "Darwin" ]]; then
  source /usr/local/opt/antidote/share/antidote/antidote.zsh
elif command -v apt > /dev/null; then
  source ~/.config/antidote/antidote.zsh
else
  source ~/.antidote/antidote/antidote.zsh
fi

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# GENERAL

# (bonus: Disable sound errors in Zsh)

# never beep
setopt NO_BEEP

# USER PROMPT
# enable command-subsitution in PS1
setopt PROMPT_SUBST
eval "$(starship init zsh)"

# custom aliases

clear() {
        /usr/bin/clear; tput cup "$(tput lines)"; exec "$SHELL" -l
}