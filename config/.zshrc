
source ~/.aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=500000

setopt autocd extendedglob notify
bindkey -v
bindkey -M viins '^[^?' backward-kill-word

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

if [[ -d $HOME/.local/share/pnpm ]] ; then
  export PNPM_HOME="$HOME/.local/share/pnpm"
  export PATH="$PNPM_HOME:$PATH"
fi

if [[ -d $HOME/.wasmtime ]] ; then
  export WASMTIME_HOME="$HOME/.wasmtime"
  export PATH="$WASMTIME_HOME/bin:$PATH"
fi

if [[ -s $HOME/.atuin/bin/env ]]; then
  source $HOME/.atuin/bin/env
  eval "$(atuin init zsh)"
fi

[[ $(command -v starship) ]] && eval "$(starship init zsh)"
[[ $(command -v zoxide) ]] && eval "$(zoxide init zsh)"
[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"

# Machine specific zshrc
[[ -f $HOME/.zshrc.local ]] && source "$HOME/.zshrc.local"

[[ -d /opt/avr-gcc ]] && export PATH=/opt/avr-gcc/bin:$PATH

# bun completions
[[ -s "$HOME/.bun/_bun" ]] && source "$HOME/.bun/_bun"
eval "$(~/.local/bin/mise activate zsh)"


