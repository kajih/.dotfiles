#!/bin/bash
# One-time migration cleanup: removes SDKMAN, NVM, and RVM (replaced by mise)

removed=()
skipped=()

remove_dir() {
    local name=$1 dir=$2
    if [ -d "$dir" ]; then
        rm -rf "$dir"
        removed+=("$name ($dir)")
    else
        skipped+=("$name — not found, skipping")
    fi
}

remove_dir "SDKMAN" "$HOME/.sdkman"
remove_dir "NVM"    "$HOME/.nvm"
remove_dir "RVM"    "$HOME/.rvm"

# Strip leftover init lines from any non-symlinked shell configs.
# Stowed machines are already clean; this handles un-stowed or partial setups.
for f in "$HOME/.bashrc" "$HOME/.zshrc" "$HOME/.profile" "$HOME/.bash_profile"; do
    [ -f "$f" ] && [ ! -L "$f" ] || continue
    sed -i \
        -e '/SDKMAN_DIR/d' \
        -e '/sdkman-init\.sh/d' \
        -e '/THIS MUST BE AT THE END.*SDKMAN/d' \
        -e '/NVM_DIR/d' \
        -e '/nvm\.sh/d' \
        -e '/nvm bash_completion/d' \
        -e '/rvm\/bin/d' \
        -e '/rvm\/scripts\/rvm/d' \
        "$f"
    echo "Cleaned: $f"
done

echo ""
(( ${#removed[@]}  > 0 )) && printf "Removed:  %s\n" "${removed[@]}"
(( ${#skipped[@]}  > 0 )) && printf "Skipped:  %s\n" "${skipped[@]}"
echo ""
echo "Done. Install your tools with mise, e.g.:"
echo "  mise use --global java@temurin-21"
echo "  mise use --global gradle@8"
echo "  mise use --global node@lts"
