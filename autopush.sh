#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/printer_data/config"
cd "$REPO"

# Only react to real config changes (tweak if you want)
WATCH_GLOBS=("*.cfg" "*.conf" "*.md" ".gitignore")

# Debounce: wait a bit after changes to group multiple saves into 1 commit
DEBOUNCE_SECONDS=5

echo "Auto-push watching: $REPO"
echo "Debounce: ${DEBOUNCE_SECONDS}s"

commit_and_push() {
  # nothing to do?
  if git diff --quiet && git diff --cached --quiet; then
    return
  fi

  # don't commit ignored junk if it slipped in
  git add -A

  # If still nothing staged, exit
  if git diff --cached --quiet; then
    return
  fi

  msg="Auto update $(date '+%Y-%m-%d %H:%M:%S')"
  git commit -m "$msg" >/dev/null || true

  # push (won't error if nothing new)
  git push >/dev/null || true
  echo "Pushed: $msg"
}

# Watch for changes; group bursts
while true; do
  inotifywait -qq -r -e close_write,move,create,delete "$REPO" >/dev/null
  sleep "$DEBOUNCE_SECONDS"
  commit_and_push
done
