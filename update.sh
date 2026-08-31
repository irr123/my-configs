#!/usr/bin/env bash
# Regular system + tooling update. Each step is non-fatal.
# Usage: update [-a|--all]   # -a adds heavier/optional steps
set -uo pipefail

FULL=0
CLEAN=0
case "${1:-}" in
  "") ;;
  -a|--all|--full) FULL=1; CLEAN=1 ;;
  -c|--clean) CLEAN=1 ;;
  -h|--help) echo "usage: update [-a|--all] [-c|--clean]  # -a adds softwareupdate, brew doctor, npm/rustup/mas; -c adds mo maintenance"; exit 0 ;;
  *) echo "usage: update [-a|--all] [-c|--clean]" >&2; exit 2 ;;
esac

step() { printf '\n\033[1;36m==> %s\033[0m\n' "$*"; }
run()  { "$@" || { printf '\033[1;33m[warn] failed: %s\033[0m\n' "$*"; return 1; }; }

start=$(date +%s)

step "brew upgrade"
run brew upgrade -y
run brew cleanup
run brew autoremove

step "pi update --all"
run pi update --all

step "my-configs pull + submodules"
(cd ~/workspace/my-configs && run git pull --ff-only && git submodule foreach 'git checkout master 2>/dev/null || git checkout main; git pull --ff-only')

step "vim-lsp-settings servers"
LSP_SRV=~/.local/share/vim-lsp-settings/servers
LSP_INST=~/.vim/pack/plugins/start/lsp-settings/installer
if [ -d "$LSP_SRV" ]; then
  for d in "$LSP_SRV"/*/; do
    [ -d "$d" ] && [ ! -L "${d%/}" ] || continue
    s=$(basename "$d")
    sh="$LSP_INST/install-$s.sh"
    [ -f "$sh" ] || { printf '\033[1;33m[warn] no installer for %s\033[0m\n' "$s"; continue; }
    printf '  - %s\n' "$s"
    backup=$(mktemp -d "$d/.update.XXXXXX") || { printf '\033[1;33m[warn] failed: %s\033[0m\n' "$s"; continue; }
    for link in "$d"* "$d".[^.]* "$d"..?*; do [ -L "$link" ] && mv "$link" "$backup"; done
    if ( cd "$d" && sh "$sh" ) >/dev/null 2>&1; then
      rm -rf "$backup"
    else
      for link in "$d"* "$d".[^.]* "$d"..?*; do [ -L "$link" ] && rm "$link"; done
      for link in "$backup"/* "$backup"/.[^.]* "$backup"/..?*; do
        [ -L "$link" ] || continue
        rm -rf "$d${link##*/}"
        mv "$link" "$d"
      done
      rmdir "$backup"
      printf '\033[1;33m[warn] failed: %s\033[0m\n' "$s"
    fi
  done
fi

if [ "$CLEAN" -eq 1 ]; then
  command -v mo >/dev/null && { step "mo maintenance"; run mo clean; run mo optimize; }
fi

if [ "$FULL" -eq 1 ]; then
  step "brew doctor"
  run brew doctor   # doctor exits non-zero on mere warnings

  command -v mas    >/dev/null && { step "mas upgrade";   run mas upgrade; }
  command -v rustup >/dev/null && { step "rustup update"; run rustup update; }
  command -v npm    >/dev/null && { step "npm -g update"; run npm update -g; }

  step "softwareupdate -i -a (macOS)"
  run sudo softwareupdate -i -a
fi

printf '\n\033[1;32mDone in %ds\033[0m\n' "$(( $(date +%s) - start ))"
