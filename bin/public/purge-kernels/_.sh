
# === {{CMD}}  Remove old kernels in case unable to
# ===          install new ones.
purge-kernels () {
  local CURRENT="$(vkpurge list | sort --version-sort | tac)"
  local TOTAL="$(echo "$CURRENT" | wc -l)"

  echo "TOTAL: $TOTAL"

  if [[ ! "$TOTAL" -gt 5 ]]; then
    echo "No purge necessary." >&2
    return 0
  fi

  local OLD="$(echo "$CURRENT" | tail -n +5 | tac)"
  echo "=== Removing: $OLD"
  sudo vkpurge rm $OLD
} # === end function
