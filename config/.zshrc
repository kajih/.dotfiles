# source $HOME/.profile
source ~/.aliases
[[ -f ~/.aliases.local ]] && source ~/.aliases.local

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
    zgen load chrissicool/zsh-256color
    zgen oh-my-zsh plugins/vi-mode
    zgen load wfxr/forgit
    zgen load zsh-vi-more/evil-registers
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load romkatv/powerlevel10k powerlevel10k

    # theme
    zgen oh-my-zsh themes/arrow

    # save all to init script
    zgen save
fi

# The following lines were added by compinstall
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# Kickstart zoxide
[[ $(command -v zoxide) ]] && eval "$(zoxide init zsh)"

# Machine specific zshrc
[[ -f $HOME/.zshrc.local ]] && source "$HOME/.zshrc.local"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

