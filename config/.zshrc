# source $HOME/.profile
source ~/.aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=500000
setopt autocd extendedglob notify
bindkey -v
source "${HOME}/.zgen/zgen.zsh"

# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/vi-mode
    zgen load chrissicool/zsh-256color
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load zsh-users/zsh-autosuggestions

    # theme
    zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
fi

# The following lines were added by compinstall
# zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit

if [[ -d $HOME/.local/share/pnpm ]]; then
  export PNPM_HOME="$HOME/.local/share/pnpm"
  export PATH="$PNPM_HOME:$PATH"
fi

eval "$(starship init zsh)"

# Kickstart zoxide
[[ $(command -v zoxide) ]] && eval "$(zoxide init zsh)"

# Machine specific zshrc
[[ -f $HOME/.zshrc.local ]] && source "$HOME/.zshrc.local"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
