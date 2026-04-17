# Environment
set -gx LC_ALL en_GB.UTF-8
set -gx LANG en_GB.UTF-8
set -gx LANGUAGE en
set -gx EDITOR nvim
set -gx TERM xterm-256color

# WSL
if type -q wsl.exe
    if string match -qi "*microsoft*" (uname -r)
        set -gx WSL_VERSION 2
    else
        set -gx WSL_VERSION 1
    end
    set -gx WSL_HOST (awk '/^nameserver / {ip=$2} END {print ip}' /etc/resolv.conf)
end

# PATH
test -d $HOME/bin            && fish_add_path $HOME/bin
test -d $HOME/bin/local      && fish_add_path $HOME/bin/local
test -d $HOME/.local/bin     && fish_add_path $HOME/.local/bin
test -d /usr/local/go/bin    && fish_add_path /usr/local/go/bin
test -d /opt/avr-gcc/bin     && fish_add_path /opt/avr-gcc/bin

# Go
if test -d $HOME/go
    set -gx GOPATH $HOME/go
    set -gx GOBIN $HOME/go/bin
    fish_add_path $GOBIN
end

# Bun
if test -d $HOME/.bun
    set -gx BUN_INSTALL $HOME/.bun
    fish_add_path $BUN_INSTALL/bin
end

# Cargo
test -d $HOME/.cargo/bin && fish_add_path $HOME/.cargo/bin

# pnpm
if test -d $HOME/.local/share/pnpm
    set -gx PNPM_HOME $HOME/.local/share/pnpm
    fish_add_path $PNPM_HOME
end

# Wasmtime
if test -d $HOME/.wasmtime
    set -gx WASMTIME_HOME $HOME/.wasmtime
    fish_add_path $WASMTIME_HOME/bin
end

# Version management (Java, Node, Ruby, Gradle, Python, Go, etc.)
type -q mise && mise activate fish | source

# Atuin
if type -q atuin
    atuin init fish | source
end

# Aliases
alias aaa 'figlet -w 120 "Arrange, Act, Assert"'
alias aptlog 'tail -n 30 /var/log/apt/history.log'
alias cat bat
alias free 'free -h'
alias gcd 'cd (git rev-parse --show-toplevel)'
alias gctags 'ctags --recurse=yes --exclude=.git --exclude=BUILD --exclude=.svn --exclude=vendor/* --exclude=node_modules/* --exclude=db/* --exclude=log/*'
alias gitroot 'git rev-parse --show-toplevel'
alias lsvim 'ls -al (which nvim)'
alias peaclock 'peaclock --config-dir ~/.config/peaclock'
alias pwdc 'pwd | xclip'
alias vim nvim
alias vimu 'nvim -u NONE'

# Tool init
type -q starship && starship init fish | source
type -q zoxide  && zoxide init fish  | source

# FZF — install plugin: fisher install PatrickF1/fzf.fish

# Local overrides
test -f $HOME/.config/fish/config.local.fish && source $HOME/.config/fish/config.local.fish

