#!/bin/bash

# Docs:
# https://iffy.freshdesk.com/support/solutions/articles/48000078223-applescript-documentation
# https://ss64.com/osx/osascript.html

set -eu
echo 'tell application "Amphetamine" to end session' | osascript
