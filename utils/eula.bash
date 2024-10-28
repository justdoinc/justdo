#!/usr/bin/env bash

export SKIP_EULA_PROMPT="${SKIP_EULA_PROMPT:-"false"}"

showEula() {
  if [[ "$SKIP_EULA_PROMPT" == "true" ]]; then
    return 0
  fi

  if [[ -f "$MAIN_DIR/.agreement-signed" ]]; then
    return 0
  fi

  cat "$MAIN_DIR/utils/eula.txt"

  read -r response

  if [[ "${response,,}" =~ ^[[:space:]]*agree[[:space:]]*$ ]]; then
    local date=$(date +%Y-%m-%d)
    echo "$date" > "$MAIN_DIR/.agreement-signed"

    "$self" join-mailing-list

    return 0
  else
    announceErrorAndExit "You must agree to the terms and conditions to proceed."

    return 1
  fi

  return 0
}

showEula
