# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

#Use en_GB because date/time is better
export LC_ALL=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LANGUAGE=en

export EDITOR=nvim

export TERM=xterm-256color
export KEYTIMEOUT=1 # ZSH VI Mode

if command -v wsl.exe &> /dev/null; then
  export WSL_VERSION=$(wsl.exe -l -v | grep -a '[*]' | sed 's/[^0-9]*//g')
  export WSL_HOST=$(tail -1 /etc/resolv.conf | cut -d' ' -f2)
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's bin/local if it exists
if [ -d "$HOME/bin/local" ] ; then
  PATH="$HOME/bin/local:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -f "$HOME/.aliases" ] ; then
  source $HOME/.aliases
fi

# Aliases not shared on git
if [ -f "$HOME/.aliases.local" ] ; then
  source $HOME/.aliases.local
fi

if [ -d "/usr/local/go" ] ; then
  PATH="$PATH:/usr/local/go/bin"
fi

if [ -d "$HOME/.local/eclipse" ] ; then
  PATH="$PATH:$HOME/.local/eclipse"
fi

# set PATH so it includes user's private go if it exists
if [ -d "$HOME/go" ] ; then
  GOPATH="$HOME/go"
  GOBIN="$HOME/go/bin"
  PATH="$PATH:$GOBIN"
fi

[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
[[ -d "$HOME/.rvm" ]] && export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

