
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
  # zgen load jeffreytse/zsh-vi-mode
  zgen oh-my-zsh plugins/vi-mode
  zgen oh-my-zsh plugins/aliases
  zgen load chrissicool/zsh-256color
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-autosuggestions # theme zgen oh-my-zsh themes/arrow

  # save all to init script
  zgen save
fi

autoload -Uz compinit
compinit

if [[ -d $HOME/.local/share/pnpm ]]; then
  export PNPM_HOME="$HOME/.local/share/pnpm"
  export PATH="$PNPM_HOME:$PATH"
fi

if [[ -d $HOME/.wasmtime ]]; then
  export WASMTIME_HOME="$HOME/.wasmtime"
  export PATH="$WASMTIME_HOME/bin:$PATH"
fi

# Initialize starship prompt
[[ $(command -v starship) ]] && eval "$(starship init zsh)"

# Kickstart zoxide
[[ $(command -v zoxide) ]] && eval "$(zoxide init zsh)"

# Machine specific zshrc
[[ -f $HOME/.zshrc.local ]] && source "$HOME/.zshrc.local"

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[[ -d /opt/avr-gcc ]] && export PATH=/opt/avr-gcc/bin:$PATH

# bun completions
[[ -s "/home/kajih/.bun/_bun" ]] && source "/home/kajih/.bun/_bun"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -d $HOME.sdkman ]] && export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -d $HOME/.rvm ]] && export PATH="$PATH:$HOME/.rvm/bin"

