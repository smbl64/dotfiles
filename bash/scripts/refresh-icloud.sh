#!/bin/bash

# This script will create a temporary file in the iCloud Drive. This will
# trigger an iCloud sync.
#
# See https://apple.stackexchange.com/a/403165/273340

set -eu

FILENAME="icloud-temp-sync-$RANDOM.tmp"
ICLOUD_FOLDER="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

FULL_PATH="$ICLOUD_FOLDER/$FILENAME"

echo "Creating $FULL_PATH"
touch "$FULL_PATH"
sleep 1s

echo "Deleting $FULL_PATH"
rm "$FULL_PATH"

echo "Done"
