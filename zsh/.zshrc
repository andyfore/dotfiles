# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

bindkey -v

# ENV Vars
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin:$HOME/.rd/bin:/opt/homebrew/bin"
# export RUSTC_WRAPPER="sccache"
export XDG_CONFIG_HOME="$HOME/.config"
export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="-I/opt/homebrew/opt/readline/include"
export LG_THEME_PATH="/Users/afore/Documents/Development/repos/catppuccin-laygit/themes-mergable/mocha/sapphire.yml"
export LG_CONFIG_FILE="$XDG_CONFIG_HOME/lazygit/config.yml,$LG_THEME_PATH"

# homebrew completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/Users/andyfore/.zshrc'

autoload -Uz compinit && compinit

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# linux
# bindkey "^[OA" up-line-or-beginning-search # Up
# bindkey "^[OB" down-line-or-beginning-search # Down

# mac
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# source antidote
# Set antidote home to local cache
export ANTIDOTE_HOME=~/.cache/antidote
if [[ $(uname) == "Darwin" ]]; then
    source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
elif [[ $(uname) == "Darwin" ]]; then
  source /usr/local/opt/antidote/share/antidote/antidote.zsh
elif command -v apt > /dev/null; then
  source ~/.config/antidote/antidote.zsh
else
  source ~/.antidote/antidote/antidote.zsh
fi

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

# GENERAL

# Aliases for shell
alias code="cd ~/Documents/Development/code/"
alias repo="cd ~/Documents/Development/repos/"
alias ociconn="oci session authenticate --region us-ashburn-1 --tenancy-name nfsandbox --profile-name DEFAULT"

# Aliases for eza
# alias ld='eza -lD'
# alias lf='eza -lF --color=always | grep -v /'
# alias lh='eza -dl .* --group-directories-first'
# alias ll='eza -al --group-directories-first'
# alias ls='eza -alF --color=always --sort=size | grep -v /'
# alias lt='eza -al --sort=modified'

# Aliases for ssh
alias pt='ssh -M -F none -o "ExitOnForwardFailure yes" -S ~/.ssh/prod-cluster-session -fNa -L 6443:atl4k8s01api.registeredsite.com:6443 afore@scooby4-priv.web.com'
alias dt='ssh -M -F none -o "ExitOnForwardFailure yes" -S ~/.ssh/devplat-cluster-session -fNa -L 6443:api.atl4devplatk8s01.registeredsite.com:6443 afore@scooby4-priv.web.com'
alias scooby='ssh afore@scooby4.web.com'
alias uap='ssh afore@jump1.infra.atl1.eigbox.com'
alias ocijump="ssh -i ~/.ssh/ocidev-jump-ssh-key  ocidev@jump.jarvis1.sandbox.registeredsite.com"

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

if [ $(ps ax | grep "[s]sh-agent" | wc -l) -eq 0 ] ; then
    eval $(ssh-agent -s) > /dev/null
    if [ "$(ssh-add -l)" = "The agent has no identities." ] ; then
        # Auto-add ssh keys to your ssh agent
        # Example:
        ssh-add ~/.ssh/id_rsa > /dev/null 2>&1
    fi
fi

# zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
source <(carapace _carapace)

# atuin support
eval "$(atuin init zsh)"

# start zellij
#eval "$(zellij setup --generate-auto-start zsh)"
