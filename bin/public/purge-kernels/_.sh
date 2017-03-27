
# === {{CMD}}  Remove old kernels in case unable to
# ===          install new ones.
purge-kernels () {
  local CURRENT="$(vkpurge list | sort --version-sort | tac)"
  local TOTAL="$(echo "$CURRENT" | wc -l)"


  if [[ "$TOTAL" -gt 5 ]]; then
    echo "TOTAL: $TOTAL"
    for VER in $(echo "$CURRENT" | tail -n +5 | tac); do
      echo "=== Removing: $VER"
      sudo vkpurge rm "$VER"
      echo ""
    done
  fi
} # === end function
