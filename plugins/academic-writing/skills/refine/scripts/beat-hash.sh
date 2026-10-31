#!/usr/bin/env bash
# Print a short hash of one beat's prose, to tell whether it changed since its last check.
# Usage: beat-hash.sh <manuscript file> "<beat marker text>"   e.g. "introduction beat 3"
# The prose runs from the marker line to the next beat marker, figure comment or heading.
set -euo pipefail
prose=$(awk -v m="<!-- $2:" '
  index($0, m) == 1 { on = 1; next }
  on && (/^<!-- / || /^#/) { exit }
  on { print }
' "$1" | sed '/^[[:space:]]*$/d')
[ -n "$prose" ] || { echo "no beat \"$2\" in $1" >&2; exit 1; }
if command -v sha256sum >/dev/null; then hash=(sha256sum); else hash=(shasum -a 256); fi  # macOS has only shasum
printf '%s\n' "$prose" | "${hash[@]}" | cut -c1-12
