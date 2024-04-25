#!/bin/bash

set -eu

# Docs:
# https://iffy.freshdesk.com/support/solutions/articles/48000078223-applescript-documentation
# https://ss64.com/osx/osascript.html

function usage () {
  local script_name="$(basename $0)"
  echo "Usage: $script_name on/off"
}

if [ $# -ne 1 ]; then
  usage
  exit 1
fi

if [ $1 == "on" ]; then
  echo 'tell application "Amphetamine" to start new session' | osascript
elif [[ $1 == "off" ]]; then
  echo 'tell application "Amphetamine" to end session' | osascript
else
  usage
  exit 1
fi
  
