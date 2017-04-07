
# === {{CMD}}
# === {{CMD}} --one-by-one # Upgrade all packages using xbps-install -yu "NAME".
upgrade () {
  case "$@" in
    --one-by-one)
      IFS=$'\n'
      for NAME in $(xbps-query -s. | cut -d '-' -f 1 | awk '{print $2}'  | sort | uniq); do
        sudo xbps-install -yu "$NAME" || :
        echo ""
      done
      ;;

    "")
      sudo xbps-install -Su
      sudo xbps-remove -O
      ;; # === end ""

    *)
      echo "!!! Invalid arguments: $@" >&2
      exit 2
      ;;
  esac
} # === end function
