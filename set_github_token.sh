#!/usr/bin/env bash

if [ -z "${BASH_VERSION:-}" ]; then
  exec bash "$0" "$@"
fi

set -euo pipefail

BASHRC_PATH="${HOME}/.bashrc"
TOKEN_INPUT="${TOKEN_INPUT:-${1:-}}"

if [[ -z "$TOKEN_INPUT" ]]; then
  read -rsp "Enter GITHUB_TOKEN: " TOKEN_INPUT
  echo
fi

if [[ -z "$TOKEN_INPUT" ]]; then
  echo "GITHUB_TOKEN is empty. Aborting."
  exit 1
fi

ESCAPED_TOKEN=${TOKEN_INPUT//\'/\'"\'"\'}
SED_TOKEN=${ESCAPED_TOKEN//&/\\&}
SED_TOKEN=${SED_TOKEN//|/\\|}

if grep -Eq '^[[:space:]]*(export[[:space:]]+)?GITHUB_TOKEN=' "$BASHRC_PATH" 2>/dev/null; then
  sed -i -E "s|^[[:space:]]*(export[[:space:]]+)?GITHUB_TOKEN=.*$|export GITHUB_TOKEN='${SED_TOKEN}'|" "$BASHRC_PATH"
  echo "GITHUB_TOKEN has been replaced in ${BASHRC_PATH}."
else
  {
    echo
    echo "# Added by set_github_token.sh on $(date '+%Y-%m-%d %H:%M:%S')"
    echo "export GITHUB_TOKEN='${ESCAPED_TOKEN}'"
  } >> "$BASHRC_PATH"
  echo "GITHUB_TOKEN has been added to ${BASHRC_PATH}."
fi

echo "Run: source ~/.bashrc"
